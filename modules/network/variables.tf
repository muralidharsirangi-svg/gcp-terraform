variable "project_id" {
  description = "Google Cloud project ID."
  type        = string
}

variable "network_name" {
  description = "Name of the custom VPC network."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "region" {
  description = "Google Cloud region for the subnet."
  type        = string
}

variable "subnet_cidr" {
  description = "IPv4 CIDR range for the subnet."
  type        = string
}

variable "webserver_tag" {
  description = "Network tag that firewall rules apply to."
  type        = string
}
