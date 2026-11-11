resource "google_compute_network" "this" {
  project                 = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "this" {
  project                  = var.project_id
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow_http" {
  project = var.project_id
  name    = "${var.network_name}-allow-http"
  network = google_compute_network.this.id

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.webserver_tag]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

resource "google_compute_firewall" "allow_iap_ssh" {
  project = var.project_id
  name    = "${var.network_name}-allow-iap-ssh"
  network = google_compute_network.this.id

  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
  target_tags   = [var.webserver_tag]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
