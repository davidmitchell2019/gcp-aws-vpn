/*
 * Terraform compute resources for GCP.
 * Acquire all zones and choose one randomly.
 */
data "google_compute_zones" "available" {
  region = "${var.gcp_region}"
}
resource "google_compute_address" "gcp-ip" {
  name = "gcp-vm-ip-${var.gcp_region}"
  region = "${var.gcp_region}"
}
resource "google_compute_instance" "gcp-vm" {
  name         = "vpn-tunnel-bastion"
  machine_type = "${var.gcp_instance_type}"
  zone         = "${data.google_compute_zones.available.names[0]}"

  boot_disk {
    initialize_params {
      image = "${var.gcp_disk_image}"
    }
  }

  tags = ["name", "vpntunnelbastion"]

  network_interface {
    subnetwork = "${google_compute_subnetwork.gcp-subnet1.name}"
    network_ip = "${var.gcp_vm_address}"

    access_config {
      # Static IP
      nat_ip = "${google_compute_address.gcp-ip.address}"
    }
  }

  metadata_startup_script = "echo hi > /test.txt"
}
