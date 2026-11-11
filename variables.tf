variable "project_id" {
  description = "Google Cloud project ID to deploy resources into."
  type        = string
}

variable "region" {
  description = "Google Cloud region for the VPC subnet."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud zone for the web server VM."
  type        = string
  default     = "us-central1-a"
}

variable "network_name" {
  description = "Name of the custom VPC network."
  type        = string
  default     = "webserver-vpc"
}

variable "subnet_name" {
  description = "Name of the web server subnet."
  type        = string
  default     = "webserver-subnet"
}

variable "subnet_cidr" {
  description = "IPv4 CIDR range for the web server subnet."
  type        = string
  default     = "10.10.1.0/24"
}

variable "webserver_tag" {
  description = "Network tag used to target the web server firewall rules."
  type        = string
  default     = "webserver"
}

variable "instance_name" {
  description = "Name of the web server VM."
  type        = string
  default     = "webserver"
}

variable "second_instance_name" {
  description = "Name of the second web server VM."
  type        = string
  default     = "webserver-2"
}

variable "machine_type" {
  description = "Compute Engine machine type for the web server."
  type        = string
  default     = "e2-micro"
}
