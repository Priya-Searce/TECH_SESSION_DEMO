output "vm-id" {
  description = "Name of Instance"
  value       = google_compute_instance.new_vm.instance_id
}

output "vm-machine-type" {
  description = "Name of Instance"
  value       = google_compute_instance.new_vm.machine_type
}

output "public_ip" {
  value = google_compute_address.static_external_ip_address.address
}

output "ssh_private_key" {
  value     = tls_private_key.ssh.private_key_pem
  sensitive = true
}