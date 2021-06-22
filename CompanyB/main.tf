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

module "dependencies" {
  source = "../modules/fabric-client-deps"

  crypto_bucket_name        = var.crypto_bucket_name
  fabric_access_role_name   = var.fabric_access_role_name
  org_name                  = var.org_name
  key_pair_name             = var.key_pair_name
  iam_instance_profile_name = var.iam_instance_profile_name
}

module "fabric-client" {
  source = "../modules/fabric-client"

  crypto_bucket             = module.dependencies.crypto_bucket
  iam_role                  = module.dependencies.iam_role
  key_pair                  = module.dependencies.key_pair
  org1_name                 = var.org_name
  org2_name                 = var.second_org_name
  security_group_id         = module.vpc1.security_group_id
  peer_endpoint             = var.peer_endpoint
  vpc_id                    = module.vpc1.vpc_id
  private_subnets           = module.vpc1.subnets
  org2_id                   = var.org2_id
  org1_id                   = var.org1_id
  org1_ca_pw                = var.admin_passwd
  ca_endpoint               = var.ca_endpoint
  org1_ca_uname             = var.admin_username
  ordering_endpoint         = var.ordering_endpoint
  iam_instance_profile_name = var.iam_instance_profile_name
}
