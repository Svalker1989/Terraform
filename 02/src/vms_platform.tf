variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
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

/*variable "cores" {
  type        = number
  default     = 2
  description = "cores number"
}

variable "mem" {
  type        = number
  default     = 1
  description = "mem number"
}

variable "fraction" {
  type        = number
  default     = 5
  description = "fraction number"
}*/
#Second vars

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "zone for vm db"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop-vm-db"
  description = "VPC network & subnet name for vm db"
}

variable "vm_name" {
  type        = string
  default     = "netology-develop-platform"
  description = "name for compute resourse"
}

variable "vm_db_prefix" {
  type        = string
  default     = "db"
  description = "prefix for compute resourse db"
}

variable "vm_web_prefix" {
  type        = string
  default     = "web"
  description = "prefix for compute resourse web"
}

/*variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "cores number"
}

variable "vm_db_mem" {
  type        = number
  default     = 2
  description = "mem number"
}

variable "vm_db_fraction" {
  type        = number
  default     = 20
  description = "fraction number"
}*/