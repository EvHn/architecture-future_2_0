terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "futureterraform"
    region = "ru-central1"
    key    = "futureterraform/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  zone = var.availability_zone
}

module "vm" {
  source = "../Task1Advanced/modules/vm"

  availability_zone = var.availability_zone
  vm_image          = var.vm_image
  vm_name           = var.vm_name
  vm_cores          = var.vm_cores
  vm_memory         = var.vm_memory
  vm_disk_name      = var.vm_disk_name
  vm_disk_type      = var.vm_disk_type
  vm_disk_size      = var.vm_disk_size
  subnet_id         = var.subnet_id
  ssh_key           = var.ssh_key
}