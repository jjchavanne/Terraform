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
