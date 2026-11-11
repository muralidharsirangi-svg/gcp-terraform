output "instance_name" {
  description = "Name of the created Compute Engine instance."
  value       = google_compute_instance.this.name
}

output "external_ip" {
  description = "Public IPv4 address of the web server."
  value       = google_compute_instance.this.network_interface[0].access_config[0].nat_ip
}
