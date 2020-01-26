provider "google" {
  project = "${var.project_name}"
}
resource "google_compute_instance" "default" {
  name         = "debian"
  machine_type = "n1-standard-1"
  #tags         = [""]
  zone = "${var.zone}"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  #labels {}
  #metadata {}
  network_interface {
    network = "default"
    access_config {
    }
  }
}