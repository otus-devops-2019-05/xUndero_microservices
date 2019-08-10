variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-d"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable docker_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-docker"
}

variable inst_count {
  default = 1
}
