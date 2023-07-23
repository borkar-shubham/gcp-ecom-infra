# data "google_compute_network" "default" {
#   name                    = "default"
# }

# ## SUBNET
# resource "google_compute_subnetwork" "subnet-1" {
#   name                     = var.subnet-name
#   ip_cidr_range            = var.subnet-cidr
#   network                  = data.google_compute_network.default.self_link
#   region                   = var.region
#   private_ip_google_access = var.private_google_access
# }

# resource "google_compute_firewall" "default" {
#   name    = "test-firewall"
#   network = data.google_compute_network.default.self_link

#   allow {
#     protocol = "icmp"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "8080", "1000-2000", "22"]
#   }

#   source_tags = ["web"]
# }

resource "google_compute_instance" "nginx-proxy" {
  name         = var.compute_instance_name
  machine_type = var.machine_type
  zone         = var.zone_name

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
      }
    }

  network_interface {
    network = var.network_interface
  }
}