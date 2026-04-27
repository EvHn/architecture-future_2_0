output "vm_id" {
  value       = yandex_compute_instance.vm.id
  description = "VM ID"
  sensitive   = true
}
output "vm_hostname" {
  value       = yandex_compute_instance.vm.hostname
  description = "VM hostname"
  sensitive   = true
}
output "disk_id" {
  value       = yandex_compute_disk.vm_disk.id
  description = "Disk ID"
  sensitive   = true
}
output "disk_name" {
  value       = yandex_compute_disk.vm_disk.name
  description = "Disk name"
  sensitive   = true
}
