variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "Region where the instance template and instance should be created."
}

variable "zone" {
  type        = string
  description = "Zone where the instance template and instance should be created."
}

variable "network" {
  description = "The name or self_link of the network to attach this interface to. Use network attribute for Legacy or  subnetted networks and subnetwork for custom subnetted networks."
  default     = ""
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach this interface to. The subnetwork must exist in the same region this instance will be created in. Either network or subnetwork must be provided."
  default     = ""
}

variable "instance_name" {
  type  = string
  
}

variable "machine_type" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "labels" {
}

