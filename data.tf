data "google_compute_default_service_account" "default" {
  project = local.project_id
}

data "google_compute_network" "vpc" {
  project = local.project_id
  name    = var.vpc_name
}

data "google_compute_subnetwork" "subnet" {
  project = local.project_id
  name    = var.subnet_name
  region  = var.region
}