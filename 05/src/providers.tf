terraform {
  required_providers {
    yandex = {
      version = "0.109.0"
      source = "yandex-cloud/yandex"
    }
    template = {
      version = "2.2.0"
      source = "hashicorp/template"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}