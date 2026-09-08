data "google_compute_image" "debian" {
  family  = "debian-12"
  project = "debian-cloud"
}

resource "google_compute_instance" "web" {
  count = 2

  name         = "acjc-web-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = var.zone

  tags = [
    "web",
    "iap-ssh"
  ]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian.self_link
    }
  }

  network_interface {
    network = var.network_name

    access_config {}
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}

