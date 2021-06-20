terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

resource "aws_route_table_association" "route_table_associations" {

  for_each = var.route_table_az_map

  subnet_id      = each.value.id
  route_table_id = each.key
}

resource "aws_vpc_endpoint" "fabric_endpoint" {
  vpc_id              = var.vpc_id
  service_name        = var.fabric_service_name
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [var.security_group_id]
  private_dns_enabled = true
  subnet_ids          = var.subnets

  tags = {
    Name = "Fabric VPC Endpoint"
  }
}
