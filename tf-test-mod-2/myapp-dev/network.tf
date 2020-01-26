# COME BACK TO THIS LATER
#variable "vpc_name" {}

# Create the custom vpc network
#resource "google_compute_network" "custom-vpc" {
#  name                    = "${var.vpc_name}"
#  auto_create_subnetworks = "false"
#}

# Create the managementnet network
resource "google_compute_network" "managementnet" {
  name                    = "managementnet"
  auto_create_subnetworks = "false"
}

variable "fw_rule_name" {}
variable "allowed_network" {}

# Firewall rule to allow HTTP, SSH, and RDP traffic
resource "google_compute_firewall" "allow-http-ssh-rdp-icmp" {
  name      = "${var.fw_rule_name}"
  network   = "${var.allowed_network}"
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }
  allow {
    protocol = "icmp"
  }
}
# Create managementsubnet-us subnetwork
resource "google_compute_subnetwork" "managementsubnet-us" {
  name          = "managementsubnet-us"
  region        = "us-central1"
  network       = "${google_compute_network.managementnet.self_link}"
  ip_cidr_range = "10.130.0.0/20"
}
