provider "google" {
  region = "${var.region}"
}
resource "google_compute_instance" "default" {
  project      = "${var.project_name}"
  name         = "vm-debian"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
