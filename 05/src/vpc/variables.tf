variable "default_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  description = "VPC network&subnet name"
}

variable "create_vpc" {
  type        = bool
  default     = true
  description = "Shows whether a VCP object should be created. If false, an existing `vpc_id` is required."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "Existing `network_id` (`vpc-id`) where resources will be created"
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
  type        = list(object({  zone=string, cidr=string }))
  default     = null
}*/