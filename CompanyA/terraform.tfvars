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

# Dynamic values
fabric_service_name = "com.amazonaws.eu-west-2.managedblockchain.n-bz54v7iaivcmrcskbrz4tfuhjy"
invitation_id = ""
nw_id = ""
peer_endpoint = "nd-y6zx2cxlbnfsxmldmx7s3fes5y.m-3kgtypmcu5f7zaksednsht7e6y.n-bz54v7iaivcmrcskbrz4tfuhjy.managedblockchain.eu-west-2.amazonaws.com:30003"
org2_id = "m-BQIBLP5HAFE3PHTJ5IALYBDELU"
org1_id = "m-3KGTYPMCU5F7ZAKSEDNSHT7E6Y"
ca_endpoint = "ca.m-3kgtypmcu5f7zaksednsht7e6y.n-bz54v7iaivcmrcskbrz4tfuhjy.managedblockchain.eu-west-2.amazonaws.com:30002"
ordering_endpoint = "orderer.n-bz54v7iaivcmrcskbrz4tfuhjy.managedblockchain.eu-west-2.amazonaws.com:30001"
