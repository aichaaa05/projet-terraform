resource "google_compute_firewall" "web" {
  name    = "acjc-tf-allow-ssh-iap"
  network = google_compute_network.main.name

  direction = "INGRESS"

  source_ranges = [
    "35.235.240.0/20"
  ]

  target_tags = [
    "iap-ssh"
  ]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "web" {
  name    = "acjc-tf-allow-web"
  network = google_compute_network.main.name

  source_ranges = [
    "0.0.0.0/0"
  ]

  target_tags = [
    "web"
  ]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
