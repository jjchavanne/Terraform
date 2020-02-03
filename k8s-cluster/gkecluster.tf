resource "google_container_cluster" "gke-cluster" {
  name               = "gke-cluster1"
  network            = "default"
  location           = "${var.zone}"
  initial_node_count = 3

  #  master_auth {
  #    username = ""
  #    password = ""

  #    client_certificate_config {
  #      issue_client_certificate = false
  #    }
  #  }

}
