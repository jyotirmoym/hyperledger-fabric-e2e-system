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
