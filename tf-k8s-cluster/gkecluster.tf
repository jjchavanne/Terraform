resource "google_container_cluster" "gke-cluster" {
  name                     = "my-cluster1"
  network                  = "default"
  location                 = "${var.zone}"
  remove_default_node_pool = true
  initial_node_count       = 1

}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "${var.zone}"
  cluster    = google_container_cluster.gke-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

# Temporarily need to enable these as well
# gcloud config set compute/zone us-central1-b
# gcloud container clusters get-credentials my-cluster1