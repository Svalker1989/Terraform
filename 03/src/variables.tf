###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "os_family"
}

variable "platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "disk_size" {
  type        = number
  default     = "1"
  description = "disk_size"
}

variable "single_name" {
  type        = string
  default     = "storage"
  description = "single_name"
}

variable "vms_resources" {
  type = map(object({
    cores = number
    memory  = number
    core_fraction = number
  }))
}

variable "metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys  = string
  }))
}

variable "each_vm" {
  type = map(object({  vm_name=string, cpu=number, ram=number, disk_volume=number, core_fraction=number }))
}

#each["vm_name"]