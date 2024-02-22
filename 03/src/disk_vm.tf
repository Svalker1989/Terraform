resource "yandex_compute_disk" "volume" {
  count    = 3
  name     = "volume-${count.index}"
  size     = var.disk_size
}

  resource "yandex_compute_instance" "storage" {
  name        = var.single_name
  hostname    = "${var.single_name}.netology.ru"
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

 dynamic "secondary_disk" {
#   for_each = "${yandex_compute_disk.storage_1.*.id}"
   for_each = { for vol in yandex_compute_disk.volume[*]: vol.name=> vol }
   content {
#     disk_id = yandex_compute_disk.volume["${secondary_disk.key}"].id
     disk_id = secondary_disk.value.id
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