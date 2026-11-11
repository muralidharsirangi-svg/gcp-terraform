variable "project_id" {
  description = "Google Cloud project ID."
  type        = string
}

variable "instance_name" {
  description = "Name of the Compute Engine instance."
  type        = string
}

variable "zone" {
  description = "Google Cloud zone for the instance."
  type        = string
}

variable "machine_type" {
  description = "Compute Engine machine type."
  type        = string
}

variable "subnet_self_link" {
  description = "Self-link of the subnet for the instance."
  type        = string
}

variable "network_tags" {
  description = "Network tags used by firewall rules."
  type        = list(string)
}
