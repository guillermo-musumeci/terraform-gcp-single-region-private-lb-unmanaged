# Single region, private only network configuration | network.tf

# create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.app_name}-${var.app_environment}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create private subnet
resource "google_compute_subnetwork" "private_subnet_1" {
  provider      = "google-beta"
  purpose       = "PRIVATE"
  name          = "${var.app_name}-${var.app_environment}-private-subnet-1"
  ip_cidr_range = var.private_subnet_cidr_1
  network       = google_compute_network.vpc.name
  region        = var.gcp_region_1
}

# create a public ip for nat service
resource "google_compute_address" "nat_ip" {
  name    = "${var.app_name}-${var.app_environment}-nap-ip"
  project = var.app_project
  region  = var.gcp_region_1
}

# create a nat to allow private instances connect to internet
resource "google_compute_router" "nat-router" {
  name    = "${var.app_name}-${var.app_environment}-nat-router"
  network = google_compute_network.vpc.name
}

resource "google_compute_router_nat" "nat-gateway" {
  name                               = "${var.app_name}-nat-gateway"
  router                             = google_compute_router.nat-router.name
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [ google_compute_address.nat_ip.self_link ]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  depends_on                         = [ google_compute_address.nat_ip ]
}

# show nat ip address
output "nat_ip_address" {
  value = google_compute_address.nat_ip.address
}

# allow internal icmp
resource "google_compute_firewall" "allow-internal" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-internal"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = [
    "${var.private_subnet_cidr_1}"
  ]
}
