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
crypto_bucket_name = "simple-network-crypto-bucket-b"
fabric_access_role_name = "FabricSimpleNetworkAccessRole"
key_pair_name = "fabric-client-key"
second_org_name = ""
iam_instance_profile_name = "FabricClientInstanceProfile"
user_pool_name = "FabricUserPool"

# Dynamic values
fabric_service_name = "com.amazonaws.eu-west-2.managedblockchain.n-bz54v7iaivcmrcskbrz4tfuhjy"
invitation_id = "in-OSBY6IYAAND2RMSKF34DMF5TFQ"
nw_id = "n-BZ54V7IAIVCMRCSKBRZ4TFUHJY"
peer_endpoint = "nd-fhvyquo44zefplmgpd4l2lmfaq.m-bqiblp5hafe3phtj5ialybdelu.n-bz54v7iaivcmrcskbrz4tfuhjy.managedblockchain.eu-west-2.amazonaws.com:30006"
org2_id = "" # m-4VDJYYKB75BQZEJVYJJKMSH7ZY
org1_id = "m-BQIBLP5HAFE3PHTJ5IALYBDELU"
ca_endpoint = "ca.m-bqiblp5hafe3phtj5ialybdelu.n-bz54v7iaivcmrcskbrz4tfuhjy.managedblockchain.eu-west-2.amazonaws.com:30005"
ordering_endpoint = "orderer.n-bz54v7iaivcmrcskbrz4tfuhjy.managedblockchain.eu-west-2.amazonaws.com:30001"
