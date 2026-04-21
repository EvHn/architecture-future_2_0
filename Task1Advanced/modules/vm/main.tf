terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_image
}

resource "yandex_compute_disk" "vm_disk" {
  name     = var.vm_disk_name
  type     = var.vm_disk_type
  zone     = var.availability_zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size     = var.vm_disk_size
}

resource "yandex_compute_instance" "vm" {
  name = var.vm_name
  zone = var.availability_zone
  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.vm_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "testUser:${var.ssh_key}"
  }
}