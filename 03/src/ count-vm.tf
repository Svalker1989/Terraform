

data "yandex_compute_image" "ubuntu" {
  family = var.os_family
}

resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.db]
  name        = "web-${count.index + 1}"
  hostname    = "web-${count.index + 1}.netology.ru"
  count       = 2
  platform_id = var.platform_id
  resources {
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
    serial-port-enable = var.metadata["ssh"].serial-port-enable
    ssh-keys           = local.ssh
  }
}