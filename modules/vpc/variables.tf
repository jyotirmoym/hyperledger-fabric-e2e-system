# variable "security_group_name" {
#   description = "The security group allowing communication with the fabric network (The blockchain VPC endpoint should be created with this security group)"
# }

# variable "security_group_description" {
#   description = "The security group description"
# }

variable "cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets"
}

variable "subnet_names" {
  type        = list(string)
  description = "The name of the private subnet"
}

# variable "route_table_name" {
#   type        = string
#   description = "The name of the private subnets route"
# }

variable "nat_names" {
  type        = list(string)
  description = "The name of the NAT gateways"
}

variable "eip_names" {
  type        = set(string)
  description = "The name of the NAT Elastic IP"
}

# variable "blockchain_service_name" {
#   type        = string
#   description = "The name of the fabric blockchain service to create the VPC interface end point"
# }

# variable "s3_service_name" {
#   type        = string
#   description = "The name of the S3 service to create the VPC gateway end point"
# }
