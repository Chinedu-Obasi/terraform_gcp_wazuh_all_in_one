variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "credentials_file" {
  description = "Path to the GCP credentials JSON file"
  type        = string
}

variable "service_account_email" {
  description = "The service account email to be used for GCP resources"
  type        = string
}

variable "wazuh_instance_count" {
  description = "Number of Wazuh agent instances"
  type        = number
  default     = 2
}

variable "server_instance_type" {
  description = "Type of GCP instance"
  type        = string
  default     = "e2-medium"           # Using this instance type to meet minimum requirements of 4GB RAM and 2VCPU cores for Wazuh server
}

variable "agent_instance_type" {
  description = "Type of GCP instance"
  type        = string
  default     = "e2-small"
}

variable "image" {
  description = "OS image to use for the instances"
  type        = string
  default     = "ubuntu-2204-lts"     # Use any instance image as needed
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}
