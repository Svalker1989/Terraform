output "vpc_id" {
  description = "ID of the created network for internal communications"
  value       = var.create_vpc ? yandex_vpc_network.module_vpc[0].id : null
}

/*output "output_subnets" {
 value       = yandex_vpc_subnet.module_vpc_subnet.id
}*/

#Вариант для З.4*
output "output_subnets" {
 description = "Map of private subnets: `key = first v4_cidr_block`"
  value = { for v in yandex_vpc_subnet.module_vpc_subnet : v.v4_cidr_blocks[0] => {
    "subnet_id"      = v.id,
    "name"           = v.name,
    "zone"           = v.zone
    "cidr"           = v.v4_cidr_blocks
    }
  }
}