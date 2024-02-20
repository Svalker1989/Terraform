resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.os_family
}
resource "yandex_compute_instance" "platform" {
  name        = "vm-web-${local.vm_web_name}"
  platform_id = var.platform_id
  resources {
  /*cores         = var.cores
    memory        = var.mem
    core_fraction = var.fraction*/
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    /*serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_public_root_key}"*/
    serial-port-enable = var.metadata["ssh"].serial-port-enable
    ssh-keys           = var.metadata["ssh"].ssh-keys
  }
}
#second VM
resource "yandex_vpc_network" "develop2" {
  name = var.vm_db_vpc_name
}

resource "yandex_vpc_subnet" "develop2" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop2.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_instance" "platform2" {
  name        = local.vm_db_name
  platform_id = var.platform_id
  zone        = var.vm_db_zone
  resources {
  /*cores         = var.vm_db_cores
    memory        = var.vm_db_mem
    core_fraction = var.vm_db_fraction*/
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop2.id
    nat       = true
  }

  metadata = {
  /*serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_public_root_key}"*/
    serial-port-enable = var.metadata["ssh"].serial-port-enable
    ssh-keys           = var.metadata["ssh"].ssh-keys
  }

}
