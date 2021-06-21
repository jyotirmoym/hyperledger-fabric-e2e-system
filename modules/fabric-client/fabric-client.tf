terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

resource "aws_cloudformation_stack" "fabric_stack" {
  name = "${var.org1_name}-client-stack"

  parameters = {
    "SecondMemberName"        = var.org2_name
    "EC2SecurityGroup"        = var.security_group_id
    "PeerNodeEndpoint"        = var.peer_endpoint
    "VPCID"                   = var.vpc_id
    "InternetAccessSGName"    = "FabricClientInternetSG"
    "SubnetID"                = var.private_subnets[0]
    "SecondMemberID"          = var.org2_id
    "CryptoBucketName"        = var.crypto_bucket
    "MemberID"                = var.org1_id
    "MemberAdminPassword"     = var.org1_admin_pw
    "FabricCAEndpoint"        = var.ca_endpoint
    "EC2KeyPairName"          = var.key_pair
    "MemberAdminUser"         = var.org1_admin_uname
    "OrderingServiceEndpoint" = var.ordering_endpoint
    "MemberName"              = var.org1_name
    "InstanceProfileName"     = var.iam_role
  }

  template_body = file("${path.root}/../fabric-ledger-network/2. Fabric_Blockchain_Client_CF_Template.yaml")
}
