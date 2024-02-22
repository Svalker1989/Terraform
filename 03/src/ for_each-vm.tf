
resource "yandex_compute_instance" "db" {
  for_each    = var.each_vm  
  name        = each.value["vm_name"]
  hostname    = "${each.value["vm_name"]}.netology.ru"
  platform_id = var.platform_id
  resources {
    cores         = each.value["cpu"]
    memory        = each.value["ram"]
    core_fraction = each.value["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value["disk_volume"]
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