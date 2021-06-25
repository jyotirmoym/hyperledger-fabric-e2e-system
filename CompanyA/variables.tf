# Fabric blockchain variables
variable "org_network_name" {
  description = "The name of the blockchain network"
}
variable "org_name" {
  description = "The name of the member organisation"
}

variable "admin_username" {
  description = "Administrator user name of the organisation"
}

variable "admin_passwd" {
  description = "Administrator password of the organisation"
  sensitive   = true
}

variable "availability_zone" {
  description = "The availability zone where the organisation's ledger would run"
}

variable "peer_instance_type" {
  description = "The instance type of the peer node for the organisation"
  default     = "bc.t3.small"
}

variable "fabric_version" {
  description = "The fabric version"
  default     = 1.4
}

variable "nw_description" {
  description = "Description of the network"
  default     = "A simple fabric blockchain network"
}

variable "nw_id" {
  description = "The network ID (Applicable only when the network exists and some organisation wants to join the network)"
}

variable "invitation_id" {
  description = "The invitation ID to join a fabric network (Applicable only when the network exists and some organisation wants to join the network)"
}

# VPC setup variables
variable "security_group_name" {
  description = "The security group allowing communication with the fabric network (The blockchain VPC endpoint should be created with this security group)"
}

variable "security_group_description" {
  description = "The security group description"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets"
}

variable "subnet_names" {
  type        = list(string)
  description = "The name of the private subnet"
}

variable "route_table_name" {
  type        = list(string)
  description = "The name of the private subnets route"
}

variable "nat_names" {
  type        = list(string)
  description = "The name of the NAT gateways"
}

variable "eip_names" {
  type        = set(string)
  description = "The name of the NAT Elastic IP"
}

variable "fabric_service_name" {
  type = string
}

# Dependencies setup variables

variable "crypto_bucket_name" {
  type = string
}

variable "fabric_access_role_name" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "second_org_name" {
  type = string
}

variable "peer_endpoint" {
  type = string
}

variable "org2_id" {
  type = string
}

variable "org1_id" {
  type = string
}

variable "ca_endpoint" {
  type = string
}

variable "ordering_endpoint" {
  type = string
}

variable "iam_instance_profile_name" {
  type = string
}

# Cognito user pool

variable "user_pool_name" {
  description = "The name of the member organisation"
}