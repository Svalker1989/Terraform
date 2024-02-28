terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

locals {
  vpc_id    = var.create_vpc ? yandex_vpc_network.module_vpc[0].id : var.vpc_id
}

resource "yandex_vpc_network" "module_vpc" {
  count       = var.create_vpc ? 1 : 0
  name        = var.vpc_name
}

  resource "yandex_vpc_subnet" "module_vpc_subnet" {
  name           = "module-subnet-${var.vpc_name}"
  zone           = var.default_zone
  network_id     = local.vpc_id
  v4_cidr_blocks = var.default_cidr
}

#Вариант для З.4*
/*resource "yandex_vpc_subnet" "module_vpc_subnet" {
  for_each       = { for index, v in var.subnets :
   v.cidr => v 
  }
  name           = "module-subnet-${var.vpc_name}-${each.key}"
  zone           = each.value.zone
  network_id     = local.vpc_id
  v4_cidr_blocks           = [each.value.cidr]
}*/
