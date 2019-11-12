# Virtual machine output | vm-output.tf

output "web-1-name" {
  value = google_compute_instance.web_private_1.name
}

output "web-1-internal-ip" {
  value = google_compute_instance.web_private_1.network_interface.0.network_ip
}

output "web-2-name" {
  value = google_compute_instance.web_private_2.name
}

output "web-2-internal" {
  value = google_compute_instance.web_private_2.network_interface.0.network_ip
}
