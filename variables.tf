#vpc variable
variable "project_name" {
  type = string
}
variable "env" {
  type = string
}
variable "region" {
  type = string
}
variable "pub_ip_cidr_range" {
  type = string
}
variable "pvt_ip_cidr_range" {
  type = string
}
variable "protocols" {
  type = list(string)
  default = [ "icmp", "tcp" ]
}
variable "ports" {
  type = list(string)
}
variable "source_tags" {
  type = list(string)
}

#compute engine variables
variable "machine_type" {
  type = string
}
# variable "zone_name" {
#   type = string
#   default = "us-central1-a"
# }

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