resource "google_container_cluster" "gke-cluster" {
  name               = "gke-cluster1"
  network            = "default"
  location           = "${var.zone}"
  initial_node_count = 3
}
