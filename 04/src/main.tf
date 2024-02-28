  module "module_vpc" {
  source         = "./vpc"
  vpc_name       = var.vpc_name
  default_zone   = var.default_zone
  default_cidr   = var.default_cidr
}
#Вариант для З.4*
/*module "module_vpc" {
  source         = "./vpc"
  vpc_name       = var.vpc_name
  subnets = [
    { zone = "ru-central1-a", cidr = "10.121.0.0/16" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" }
  ]
}*/

  module "marketing" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "marketing"
  network_id     = module.module_vpc.vpc_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.module_vpc.output_subnets]
  #Вариант для З.4*
  #subnet_ids     = [module.module_vpc.output_subnets["10.121.0.0/16"].subnet_id]
  instance_name  = "web"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "analytics"
  network_id     = module.module_vpc.vpc_id
  subnet_zones   = ["ru-central1-b"]
  subnet_ids     = [module.module_vpc.output_subnets]
  #Вариант для З.4*
  #subnet_ids     = [module.module_vpc.output_subnets["10.0.2.0/24"].subnet_id]
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    username = "ubuntu"
    ssh_key = var.vms_ssh_key 
  }
}
