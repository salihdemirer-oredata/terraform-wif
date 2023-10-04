resource "google_compute_instance" "default" {
  name         = "github-actions-test"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  scheduling {
    provisioning_model = "SPOT"
  }
  network_interface {
    network    = data.google_compute_network.vpc.self_link
    subnetwork = data.google_compute_subnetwork.subnet.name
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }
}