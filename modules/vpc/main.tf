resource "google_compute_network" "ecom-vpc_network" {
  name                    = var.vpc_name
  project                 = var.project_name
  auto_create_subnetworks = false
}

#Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.ip_cidr_range[0]
  region        = var.region
  network       = google_compute_network.ecom-vpc_network.id
}

#Priivaate Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = var.private_subnet_name
  ip_cidr_range = var.ip_cidr_range[1]
  region        = var.region
  network       = google_compute_network.ecom-vpc_network.id
  private_ip_google_access = var.private_ip_google_access
}

resource "google_compute_firewall" "gcp-ecom-firewall" {
  name    = var.firewall_name
  network = google_compute_network.ecom-vpc_network.name

  allow {
    protocol = var.protocols[0]
  }

  allow {
    protocol = var.protocols[1]
    ports    = var.ports
  }

  source_tags = var.source_tags
}

# #Cloud Router
# resource "google_compute_router" "public" {
#   name    = "vpc-ecom-router"
#   network = google_compute_network.vpc_network.name
#   bgp {
#     asn               = 64514
#     advertise_mode    = "CUSTOM"
#   }
# }
# #Router NAT
# data "google_compute_router_nat" "ecom-NAT" {
#   name = "vpc-ecom-router-nat"
#   router = "vpc-ecom-router"
# }