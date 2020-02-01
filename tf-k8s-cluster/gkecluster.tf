resource "google_container_cluster" "gke-cluster" {
  name                     = "my-cluster1"
  network                  = "default"
  location                 = "${var.zone}"
  remove_default_node_pool = true
  initial_node_count       = 1

  #  master_auth {
  #    username = ""
  #    password = ""

  #    client_certificate_config {
  #      issue_client_certificate = false
  #    }
  #  }
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

    #    oauth_scopes = [
    #      "https://www.googleapis.com/auth/logging.write",
    #      "https://www.googleapis.com/auth/monitoring",
    #    ]
  }
}

# Temporarily need to enable this as well
# gcloud container clusters get-credentials my-cluster1