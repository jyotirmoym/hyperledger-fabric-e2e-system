terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

data "aws_vpcs" "default_vpc" {
  filter {
    name   = "isDefault"
    values = [true]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_subnet_ids" "all_subnets" {
  vpc_id = tolist(data.aws_vpcs.default_vpc.ids)[0]
}

data "aws_subnet" "all_subnets_detail" {
  for_each = data.aws_subnet_ids.all_subnets.ids
  id       = each.value
}

locals {
  az_ids     = toset(data.aws_availability_zones.available.zone_ids)
  az_id_list = tolist(data.aws_availability_zones.available.zone_ids)

  public_subnets  = [for x in data.aws_subnet.all_subnets_detail : x.id if x.default_for_az == true]
  private_subnets = [for x in aws_subnet.subnets : x]

  allocation_ids = tolist([for s in aws_eip.nat_elastic_ip : s.id])

  public_subnet_ids      = toset(local.public_subnets)
  public_subnet_ids_list = tolist(local.public_subnets)

  nat_gws = tolist([for s in aws_nat_gateway.nat_gws : s])
}

resource "aws_subnet" "subnets" {
  vpc_id = tolist(data.aws_vpcs.default_vpc.ids)[0]

  for_each = local.az_ids

  cidr_block           = var.cidr_blocks[index(local.az_id_list, each.key)]
  availability_zone_id = each.key

  tags = {
    Name = var.subnet_names[index(local.az_id_list, each.key)]
  }
}

resource "aws_eip" "nat_elastic_ip" {
  vpc = true

  for_each = var.eip_names

  tags = {
    Name = each.key
  }
}

resource "aws_nat_gateway" "nat_gws" {

  for_each = local.public_subnet_ids

  allocation_id = local.allocation_ids[index(local.public_subnet_ids_list, each.key)]
  subnet_id     = each.key

  tags = {
    Name = var.nat_names[index(local.public_subnet_ids_list, each.key)]
  }

}

resource "aws_route_table" "private_route" {
  vpc_id = tolist(data.aws_vpcs.default_vpc.ids)[0]

  for_each = aws_nat_gateway.nat_gws

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = each.value.id
  }

  tags = {
    Name = var.route_table_name[index(local.nat_gws, each.value)]
  }
}

resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = tolist(data.aws_vpcs.default_vpc.ids)[0]

  ingress {
    description = "Allow self"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    self        = true
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  tags = {
    Name = var.security_group_name
  }
}
