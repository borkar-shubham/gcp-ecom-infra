variable "compute_instance_name" {
  type = string
  default = "web-server"
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "zone_name" {
  type = string
  default = "us-central1-a"
}

variable "tags" {
  type = list(string)
  default = ["http", "ssh"]
}

variable "image" {
  type = string
  default = "debian-cloud/debian-11"
}

variable "network_interface" {
  type = string
  default = "default"
}