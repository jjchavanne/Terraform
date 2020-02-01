resource "google_container_cluster" "gke-cluster" {
  name               = "my-cluster1"
  network            = "default"
  location           = "${var.zone}"
  initial_node_count = 3
}

# Need to enable this as well
# gcloud config set compute/zone us-central1-b