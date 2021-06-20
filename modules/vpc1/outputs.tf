locals {
  route_table_nat_map = tomap({
    for k in aws_route_table.private_route : k.id => tolist(k.route)[0].nat_gateway_id
  })

  public_subnet_az_map = tomap({
    for i in data.aws_subnet.all_subnets_detail : i.id => i.availability_zone if i.default_for_az == true
  })

  nat_public_subnet_id_map = tomap({
    for i in aws_nat_gateway.nat_gws : i.id => i.subnet_id
  })

  az_private_subnet_map = tomap({
    for i in aws_subnet.subnets : i.availability_zone => i
  })
}

output "route_table_az_map" {
  value = tomap({
    for route_table_id, nat_id in local.route_table_nat_map : route_table_id => lookup(local.az_private_subnet_map, lookup(local.public_subnet_az_map, lookup(local.nat_public_subnet_id_map, nat_id)))
  })
}

output "vpc_id" {
  value = tolist(data.aws_vpcs.default_vpc.ids)[0]
}

output "security_group_id" {
  value = aws_security_group.security_group.id
}

output "subnets" {
  value = tolist([for x in aws_subnet.subnets : x.id])
}
