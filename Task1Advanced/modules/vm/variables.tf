variable "vm_name" {
  type        = string
  description = "VM name"
}

variable "vm_cores" {
  type        = number
  default     = 2
  description = "Number of cores for VM"
}

variable "vm_memory" {
  type        = number
  default     = 2
  description = "Memory for VM"
}

variable "vm_image" {
  type        = string
  description = "Name of VM"
}

variable "availability_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Test VM zone"
}

variable "vm_disk_size" {
  type        = number
  default     = 15
  description = "Disk size"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "ssh_key" {
  type        = string
  description = "SSH key"
}

variable "vm_disk_name" {
  type        = string
  description = "VM disk name"
}

variable "vm_disk_type" {
  type        = string
  description = "VM disk type"
}