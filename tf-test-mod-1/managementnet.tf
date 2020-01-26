# COME BACK TO THIS LATER
# Create the managementnet network with a module
#module "managementnet" {
#  source          = "./network"
#  vpc_name        = "managementnet"
#}

# Create the managementnet network
resource "google_compute_network" "managementnet" {
  name                    = "managementnet"
  auto_create_subnetworks = "false"
}

# Create managementsubnet-us subnetwork
resource "google_compute_subnetwork" "managementsubnet-us" {
  name          = "managementsubnet-us"
  region        = "us-central1"
  network       = "${google_compute_network.managementnet.self_link}"
  ip_cidr_range = "10.130.0.0/20"
}

# Add the firewall rule to allow HTTP, SSH, and RDP traffic on managementnet
module "managementnet-allow-http-ssh-rdp-icmp" {
  source          = "./fw_rule"
  fw_rule_name    = "managementnet-allow-http-ssh-rdp-icmp"
  allowed_network = "${google_compute_network.managementnet.self_link}"
}

# Add the managementnet-us-vm instance
module "managementnet-us-vm" {
  source              = "./instance"
  instance_name       = "managementnet-us-vm"
  instance_zone       = "us-central1-a"
  instance_subnetwork = "${google_compute_subnetwork.managementsubnet-us.self_link}"
}
