terraform {
  required_version = ">= 0.11.7"
}

provider "google" {
  version = "2.0.0"
  project = "${var.project}"
  region  = "${var.region}"
}

/*resource "google_compute_address" "docker_ip" {
  count = "${var.inst_count}"
  name  = "reddit-docker-ip-${count.index + 1}"
}*/

resource "google_compute_instance" "docker" {
  count        = "${var.inst_count}"
  name         = "reddit-docker-${count.index + 1}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["docker-machine"]

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      image = "${var.docker_disk_image}"
    }
  }

  network_interface {
    network = "default"

    /*    access_config {
                  nat_ip = "${google_compute_address.docker_ip.address}"
                }*/
    access_config {}
  }
}
