org_network_name = "SimpleNetwork"
org_name = "CompanyB"
admin_username = "admin"
admin_passwd = "rZ7qG8zR2tD0mY9k"
availability_zone = "eu-west-2b"

security_group_name = "fabric-security-group"
security_group_description = "The security group to be used to interact with the blockchain network"
cidr_blocks = ["172.31.48.0/20", "172.31.64.0/20", "172.31.80.0/20"]
subnet_names = ["private-subnet-a", "private-subnet-b", "private-subnet-c"]
route_table_name = ["private-route-a", "private-route-b", "private-route-c"]
nat_names = ["nat-a", "nat-b", "nat-c"]
eip_names = ["eip-nat-a", "eip-nat-b", "eip-nat-c"]