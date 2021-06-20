terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

resource "aws_cloudformation_stack" "fabric_stack" {
  name = "${var.org_network_name}-stack"

  parameters = {
    "NetworkName"         = var.org_network_name
    "MemberName"          = var.org_name
    "MemberAdminUser"     = var.admin_username
    "MemberAdminPassword" = var.admin_passwd
    "AvailabilityZone"    = var.availability_zone
    "InstanceType"        = var.peer_instance_type
    "FrameworkVersion"    = var.fabric_version
    "NetworkDesc"         = var.nw_description
    "NetworkID"           = var.nw_id
    "InvitationID"        = var.invitation_id
  }

  template_body = file("${path.root}/../fabric-ledger-network/1. Fabric_Blockchain_Template.yaml")
}
