# network varibles | network-single-region.tf

# define GCP region
variable "gcp_region_1" {
  type = string
  description = "GCP region"
}

# define GCP zone
variable "gcp_zone_1" {
  type = string
  description = "GCP zone"
}

# define private subnet
variable "private_subnet_cidr_1" {
  type = string
  description = "private subnet CIDR 1"
}

