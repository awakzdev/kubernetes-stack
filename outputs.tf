variable "gcp_project" {
  description = "project id"
}

variable "gcp_region" {
  description = "region"
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.gcp_project}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.gcp_project}-subnet"
  region        = var.gcp_region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}
