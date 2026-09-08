locals {
  name_prefix = "${var.prefix}-${var.environment}"

  common_labels = {
    environment = var.environment
    managed_by  = "terraform"
    owner       = var.prefix
  }
}

data "google_compute_image" "debian" {
  family  = "debian-13"
  project = "debian-cloud"
}

data "google_compute_subnetwork" "main" {
  name   = "${var.prefix}-subnet"
  region = var.region
}

resource "google_compute_instance" "web" {
  count = var.instance_count

  name         = "${local.name_prefix}-web-${format("%02d", count.index + 1)}"
  machine_type = var.machine_type
  zone         = var.zone

  tags = [
    "web",
    "iap-ssh"
  ]

  labels = local.common_labels

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.main.self_link

    access_config {}
  }

  service_account {
    email  = google_service_account.web.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = file("${path.module}/startup.sh")
}
