terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

provider "aws" {
  profile = "CompanyB"
  region  = "eu-west-2"
}

module "fabric_ammend" {
  source             = "../modules/fabric"
  org_network_name   = var.org_network_name
  org_name           = var.org_name
  admin_username     = var.admin_username
  admin_passwd       = var.admin_passwd
  availability_zone  = var.availability_zone
  peer_instance_type = var.peer_instance_type
  fabric_version     = var.fabric_version
  nw_description     = var.nw_description
  nw_id              = var.nw_id
  invitation_id      = var.invitation_id
}

module "vpc1" {
  source = "../modules/vpc1"

  cidr_blocks                = var.cidr_blocks
  subnet_names               = var.subnet_names
  eip_names                  = var.eip_names
  nat_names                  = var.nat_names
  route_table_name           = var.route_table_name
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
}

module "vpc2" {
  source = "../modules/vpc2"

  route_table_az_map  = module.vpc1.route_table_az_map
  fabric_service_name = var.fabric_service_name
  vpc_id              = module.vpc1.vpc_id
  security_group_id   = module.vpc1.security_group_id
  subnets             = module.vpc1.subnets
}