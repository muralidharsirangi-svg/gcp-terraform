resource "google_compute_instance" "this" {
  project                   = var.project_id
  name                      = var.instance_name
  zone                      = var.zone
  machine_type              = var.machine_type
  tags                      = var.network_tags
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = var.subnet_self_link

    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -euxo pipefail

    apt-get update
    apt-get install -y nginx
    cat > /var/www/html/index.nginx-debian.html <<'HTML'
    <!doctype html>
    <html>
      <head><title>Terraform web server</title></head>
      <body><h1>Hello from Google Cloud</h1><p>Deployed with reusable Terraform modules.</p></body>
    </html>
    HTML
    systemctl enable --now nginx
  EOT
}
