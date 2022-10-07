output "vm-id" {
  description = "Name of Instance"
  value       = google_compute_instance.new_vm.instance_id
}

output "vm-machine-type" {
  description = "Name of Instance"
  value       = google_compute_instance.new_vm.machine_type
}

output "external_ip" {
  description = "Name of Instance"
  value       = google_compute_address.static_external_ip_address.address
}