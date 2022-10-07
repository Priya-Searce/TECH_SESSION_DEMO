resource "google_compute_address" "static_external_ip_address" {
  name         = "${var.instance_name}-ext-ip-1"
  address_type = "EXTERNAL"
  region       = var.region
  lifecycle {
    prevent_destroy = false
  }

  provisioner "local-exec" {
    command = "echo ${self.address } >> ip.txt" 
  }

}

resource "google_compute_instance" "new_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  labels       = var.labels

boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }
   network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      nat_ip = google_compute_address.static_external_ip_address.address
    }
  }

  provisioner "local-exec" {
    command = "echo ${self.name } >> name.txt" 
  }
  
}

