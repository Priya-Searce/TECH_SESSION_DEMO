
resource "google_compute_address" "static_external_ip_address" {
  name         = "${var.instance_name}-ext-ip-1"
  address_type = "EXTERNAL"
  region       = var.region
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_project_service" "cloud_resource_manager" {
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key_pem" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = ".ssh/google_compute_engine"
  file_permission = "0600"
}

resource "local_file" "ssh_public_key_pem" {
  content         = tls_private_key.ssh.public_key_pem
  filename        = ".ssh/google_compute_engine.pub"
  file_permission = "0600"
}

data "google_client_openid_userinfo" "me" {}

resource "google_compute_instance" "new_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  labels       = var.labels

  metadata = {
    ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
    enable-oslogin = "true"
  }

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
  
  connection {
      host        = "${google_compute_address.static_external_ip_address.address}"
      type        = "ssh"
      user        = var.user 
      timeout     = "1m"
      port        = 22
      agent       = true
      private_key = "${file("${var.privatekeypath}")}" 
    }
  
  provisioner "file" {
    source      = "copy.sh"
    destination = "/tmp/copy.sh"
  }

  provisioner "file" {
    source      = "httpd.sh"
    destination = "/tmp/httpd.sh"
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }
}

 


