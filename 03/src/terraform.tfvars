platform_id = "standard-v1"

vms_resources = {
  web={
    cores= 2
    memory=1
    core_fraction=5
  }
}

each_vm = {
  db1 = { vm_name = "main", cpu = 2, ram = 1, disk_volume = 20, core_fraction = 5 },
  db2 = {vm_name = "replica", cpu = 4, ram = 2, disk_volume = 30, core_fraction = 20 }
}
