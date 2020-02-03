resource "google_container_node_pool" "extra-pool" {
  name               = "extra-node-pool"
  location           = "${var.zone}"
  cluster            = "${google_container_cluster.gke-cluster.name}"
  initial_node_count = 3

        #    oauth_scopes = [
    #      "https://www.googleapis.com/auth/logging.write",
    #      "https://www.googleapis.com/auth/monitoring",
    #    ]
}
