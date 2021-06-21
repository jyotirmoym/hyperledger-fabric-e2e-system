variable "org1_name" {
  description = "The name of the first member organisation"
  type = string
}

variable "org2_name" {
  description = "The name of the second member organisation"
  type = string
}

variable "crypto_bucket" {
  type = string
}

variable "iam_role" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "peer_endpoint" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "org2_id" {
  type = string
}

variable "org1_id" {
  type = string
}

variable "org1_admin_pw" {
  type = string
}

variable "ca_endpoint" {
  type = string
}

variable "org1_admin_uname" {
  type = string
}

variable "ordering_endpoint" {
  type = string
}