resource "google_compute_subnetwork" "public_subnet" {
  #name         = "${format("%s","${var.company}-${var.env}-${var.region_map["${var.var_region_name}"]}-pub-net")}"
  #name          = "${format("%s","${var.company}-${var.env}-${var.var_region_name}"-pub-net")}"
  name          = "${"${var.company}-${var.env}-${var.region_name}-pub-net"}"
  ip_cidr_range = "${var.us-cent1_public_subnet}"
  network       = "${var.network_self_link}"
  region        = "${var.var_region_name}"
}
resource "google_compute_subnetwork" "private_subnet" {
  #name         = "${format("%s","${var.company}-${var.env}-${var.region_map["${var.var_region_name}"]}-pri-net")}"
  #name          = "${format("%s","${var.company}-${var.env}-${var.var_region_name}"-pri-net")}"
  name          = "${"${var.company}-${var.env}-${var.region_name}-pri-net"}"
  ip_cidr_range = "${var.us-cent1_private_subnet}"
  network       = "${var.network_self_link}"
  region        = "${var.region_name}"
}