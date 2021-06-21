org_network_name = "SimpleNetwork"
org_name = "CompanyA"
admin_username = "admin"
availability_zone = "eu-west-2c"

security_group_name = "fabric-security-group"
security_group_description = "The security group to be used to interact with the blockchain network"
cidr_blocks = ["172.31.48.0/20", "172.31.64.0/20", "172.31.80.0/20"]
subnet_names = ["private-subnet-a", "private-subnet-b", "private-subnet-c"]
route_table_name = ["private-route-a", "private-route-b", "private-route-c"]
nat_names = ["nat-a", "nat-b", "nat-c"]
eip_names = ["eip-nat-a", "eip-nat-b", "eip-nat-c"]
crypto_bucket_name = "simple-network-crypto-bucket"
fabric_access_role_name = "FabricSimpleNetworkAccessRole"
key_pair_name = "fabric-client-key"
second_org_name = "CompanyB"
org1_admin_uname = "admin"

# Dynamic values
admin_passwd = "iW3oH4yE5iX6tG8h"
fabric_service_name = "com.amazonaws.eu-west-2.managedblockchain.n-o6fxsotesba37destlvdwelifm"
invitation_id = ""
nw_id = ""
peer_endpoint = "nd-esbvb2suhnb4nbx5vss7tpnake.m-ksaymf3hyjftnjr2yza2ibc5jy.n-o6fxsotesba37destlvdwelifm.managedblockchain.eu-west-2.amazonaws.com:30003"
org2_id = "" # m-4VDJYYKB75BQZEJVYJJKMSH7ZY
org1_id = "m-KSAYMF3HYJFTNJR2YZA2IBC5JY"
org1_admin_pw = "StrongPassword"
ca_endpoint = "ca.m-ksaymf3hyjftnjr2yza2ibc5jy.n-o6fxsotesba37destlvdwelifm.managedblockchain.eu-west-2.amazonaws.com:30002"
ordering_endpoint = "orderer.n-o6fxsotesba37destlvdwelifm.managedblockchain.eu-west-2.amazonaws.com:30001"
