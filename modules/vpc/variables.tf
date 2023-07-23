variable "project_name" {
  type = string
  default = "gcp-ecom"
}

variable "vpc_name" {
  type = string
  default = "ecom-vpc"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "ip_cidr_range" {
  type = list(string)
  default = [ "198.168.1.0/24", "198.168.2.0/24" ]
}

variable "public_subnet_name" {
  type = string
  default = "subnet-ecom-public"
}

variable "private_subnet_name" {
  type = string
  default = "subnet-ecom-private"
}

variable "private_ip_google_access" {
  type = bool
  default = true
}

variable "firewall_name" {
  type = string
  default = "ecom-firewall"
}

variable "protocols" {
  type = list(string)
  default = [ "icmp", "tcp" ]
}

variable "ports" {
  type = list(string)
  default = ["22","80", "8080", "1000-2000"]
}

variable "source_tags" {
  type = list(string)
  default = [ "web", "http", "ssh" ]

}
