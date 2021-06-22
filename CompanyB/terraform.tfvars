org_network_name = "SimpleNetwork"
org_name = "CompanyB"
admin_username = "admin"
availability_zone = "eu-west-2b"

security_group_name = "fabric-security-group"
security_group_description = "The security group to be used to interact with the blockchain network"
cidr_blocks = ["172.31.48.0/20", "172.31.64.0/20", "172.31.80.0/20"]
subnet_names = ["private-subnet-a", "private-subnet-b", "private-subnet-c"]
route_table_name = ["private-route-a", "private-route-b", "private-route-c"]
nat_names = ["nat-a", "nat-b", "nat-c"]
eip_names = ["eip-nat-a", "eip-nat-b", "eip-nat-c"]
crypto_bucket_name = "simple-network-crypto-bucket-b"
fabric_access_role_name = "FabricSimpleNetworkAccessRole"
key_pair_name = "fabric-client-key"
second_org_name = ""
org1_admin_uname = "admin"
iam_instance_profile_name = "FabricClientInstanceProfile"

# Dynamic values
admin_passwd = "iW3oH4yE5iX6tG8h"
fabric_service_name = "com.amazonaws.eu-west-2.managedblockchain.n-qkqbt3g5cnfo5pwth5k6ecacoe"
invitation_id = "in-T5DVYMSVEBBRFDNZW2PDE3JJ2U"
nw_id = "n-QKQBT3G5CNFO5PWTH5K6ECACOE"
peer_endpoint = "nd-72qrm5kky5bs7jhdtcbwcwwafy.m-4xrn4zvbt5cm5p63lfvzh4swia.n-qkqbt3g5cnfo5pwth5k6ecacoe.managedblockchain.eu-west-2.amazonaws.com:30006"
org2_id = "" # m-4VDJYYKB75BQZEJVYJJKMSH7ZY
org1_id = "m-4XRN4ZVBT5CM5P63LFVZH4SWIA"
ca_endpoint = "ca.m-4xrn4zvbt5cm5p63lfvzh4swia.n-qkqbt3g5cnfo5pwth5k6ecacoe.managedblockchain.eu-west-2.amazonaws.com:30005"
ordering_endpoint = "orderer.n-qkqbt3g5cnfo5pwth5k6ecacoe.managedblockchain.eu-west-2.amazonaws.com:30001"
