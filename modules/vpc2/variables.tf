variable "route_table_az_map" {
  type = map(any)
}

variable "fabric_service_name" {
  type = string
}

variable "vpc_id" {}

variable "security_group_id" {}

variable "subnets" {}
