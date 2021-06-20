terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

provider "aws" {
  profile = "CompanyA"
  region  = "eu-west-2"
}

# module "fabric_init" {
#   source             = "../modules/fabric"
#   org_network_name   = var.org_network_name
#   org_name           = var.org_name
#   admin_username     = var.admin_username
#   admin_passwd       = var.admin_passwd
#   availability_zone  = var.availability_zone
#   peer_instance_type = var.peer_instance_type
#   fabric_version     = var.fabric_version
#   nw_description     = var.nw_description
#   nw_id              = ""
#   invitation_id      = ""
# }

module "vpc" {
  source = "../modules/vpc"

  cidr_blocks  = var.cidr_blocks
  subnet_names = var.subnet_names
  eip_names    = var.eip_names
  nat_names    = var.nat_names
}
