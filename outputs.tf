output "webserver_external_ip" {
  description = "Public IPv4 address of the web server."
  value       = module.webserver.external_ip
}

output "webserver_url" {
  description = "HTTP URL of the web server."
  value       = "http://${module.webserver.external_ip}"
}

output "webserver_2_external_ip" {
  description = "Public IPv4 address of the second web server."
  value       = module.webserver_2.external_ip
}

output "webserver_2_url" {
  description = "HTTP URL of the second web server."
  value       = "http://${module.webserver_2.external_ip}"
}

output "vpc_name" {
  description = "Name of the created VPC network."
  value       = module.network.network_name
}

output "subnet_name" {
  description = "Name of the created subnet."
  value       = module.network.subnet_name
}
