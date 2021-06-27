org_network_name = "SimpleNetwork"
org_name = "CompanyA"
admin_username = "admin"
admin_passwd = "iW3oH4yE5iX6tG8h"
availability_zone = "eu-west-2c"

security_group_name = "fabric-security-group"
security_group_description = "The security group to be used to interact with the blockchain network"
cidr_blocks = ["172.31.48.0/20", "172.31.64.0/20", "172.31.80.0/20"]
subnet_names = ["private-subnet-a", "private-subnet-b", "private-subnet-c"]
route_table_name = ["private-route-a", "private-route-b", "private-route-c"]
nat_names = ["nat-a", "nat-b", "nat-c"]
eip_names = ["eip-nat-a", "eip-nat-b", "eip-nat-c"]
crypto_bucket_name = "simple-network-crypto-bucket-a"
fabric_access_role_name = "FabricSimpleNetworkAccessRole"
key_pair_name = "fabric-client-key"
second_org_name = "CompanyB"
iam_instance_profile_name = "FabricClientInstanceProfile"
user_pool_name = "FabricUserPool"
fabric_user_group = "FabricUserGroup"

# Dynamic values
fabric_service_name = "com.amazonaws.eu-west-2.managedblockchain.n-x23rpvpv2zaullgmvskvngsxve"
invitation_id = ""
nw_id = ""
peer_endpoint = "nd-oedepgwtkzb6beebl56mqu3y7u.m-oercfvawhnevjemtegmbap5k6y.n-x23rpvpv2zaullgmvskvngsxve.managedblockchain.eu-west-2.amazonaws.com:30003"
org1_id = "m-OERCFVAWHNEVJEMTEGMBAP5K6Y"
org2_id = "m-A3SXEMJIPNDY3KBY2M5HB2DIEQ" # m-4VDJYYKB75BQZEJVYJJKMSH7ZY
ca_endpoint = "ca.m-oercfvawhnevjemtegmbap5k6y.n-x23rpvpv2zaullgmvskvngsxve.managedblockchain.eu-west-2.amazonaws.com:30002"
ordering_endpoint = "orderer.n-x23rpvpv2zaullgmvskvngsxve.managedblockchain.eu-west-2.amazonaws.com:30001"
