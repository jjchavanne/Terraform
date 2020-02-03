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
#  metadata {
#    startup-script = <<SCRIPT
#        #! /bin/bash
#        apt-get update
#        apt-get install -y apache2
#        cat <<EOF > /var/www/html/index.html
#        <html><body><h1>Hello World</h1>
#        <p>This page was created from a simple startup script!</p>
#        </body></html>
#        SCRIPT
#  }
}
