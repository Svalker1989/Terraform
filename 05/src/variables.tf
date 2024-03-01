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
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
  default     = ["1920.1680.0.1"]
  validation {
    condition = can(regex("[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/24", var.default_cidr[0]))
    error_message = "Invalid cidr format."
  }
}

# Проверка спсика IP
/*variable "default_cidr" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
  default     = ["192.168.0.1/24", "1.1.1.1/24", "127.0.0.1/24"]
  validation {
    condition = alltrue([can(regex("[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/24",var.default_cidr[0])),can(regex("[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/24",var.default_cidr[1])),can(regex("[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/24",var.default_cidr[2]))])
    error_message = "Invalid cidr format."
  }
}*/

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "vms_ssh_key" {
  type        = string
  description = "ssh-key"
}
#Вариант для З.4*
/*variable "subnets" {
  description = <<EOF
  "Describe your subnet and zone preferences."
  Example:
  subnets = [
    { zone = "ru-central1-a", cidr = "10.121.0.0/16" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" }
  ]
  EOF
  type        = list(object({  zone=string, cidr =string }))
  default     = null
}*/


