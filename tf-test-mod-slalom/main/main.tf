provider "google" {
  project = "${var.project_name}"
}

module "vpc" {
  source                      = "../modules/global"
  env                         = "${var.env}"
  company                     = "${var.company}"
  us-cent1_public_subnet      = "${var.us-cent1_public_subnet}"
  us-cent1_private_subnet     = "${var.us-cent1_private_subnet}"
  #var_us-east4_public_subnet  = "${var.us-east4_public_subnet}"
  #var_us-east4_private_subnet = "${var.us-east4_private_subnet}"
}
module "us-cent1" {
  source                      = "../modules/us-cent1"
  network_self_link           = "${module.vpc.out_vpc_self_link}"
  subnetwork1                 = "${module.us-cent1.us-cent1_out_public_subnet_name}"
  env                         = "${var.env}"
  company                     = "${var.company}"
  us-cent1_public_subnet      = "${var.us-cent1_public_subnet}"
  us-cent1_private_subnet     = "${var.us-cent1_private_subnet}"
}

