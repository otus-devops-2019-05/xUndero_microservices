terraform {
  required_version = ">= 0.11.7"
}

provider "google" {
  version = "~> 2.18"
  project = "${var.project}"
  region  = "${var.region}"
}

/*resource "google_compute_disk" "default" {
  name = "reddit-mongo-disk"
  zone = "${var.zone}"
  size = 25
  labels = {
    environment = "dev"
  }
}*/

resource "google_container_cluster" "primary" {
  name               = "my-cluster"
  location           = "${var.zone}"
  enable_legacy_abac = true
  initial_node_count = 2

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    network_policy_config {
      disabled = false
    }
  }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  node_config {
    machine_type = "g1-small"
    disk_size_gb = 20

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

resource "google_container_node_pool" "another_primary_nodes" {
  name       = "bigpool"
  location   = "${var.zone}"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    #preemptible  = true
    machine_type = "n1-standard-2"
    disk_size_gb = 20

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

resource "google_compute_firewall" "k8s_nodeports" {
  name        = "k8s-nodeports"
  description = "My k8s rule"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["30000-32767"]
  }

  source_ranges = "${var.source_ranges}"
}
