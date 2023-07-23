resource "google_compute_network" "ecom-vpc_network" {
  name                    = "vpc-ecom"
  project                 = "my-project-name"
  auto_create_subnetworks = false
}

#Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "subnet-ecom-public"
  ip_cidr_range = "198.168.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

#Priivaate Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = "subnet-ecom-private"
  ip_cidr_range = "198.168.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

resource "google_compute_firewall" "gcp-ecom-firewall" {
  name    = "test-firewall"
  network = google_compute_network.ecom-vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
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