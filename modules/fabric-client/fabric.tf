terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

resource "aws_cloudformation_stack" "fabric_stack" {
  name = "${var.org_network_name}-client-stack"

  parameters = {
  }

  template_body = file("${path.root}/../fabric-ledger-network/2. Fabric_Blockchain_Client_CF_Template.yaml")
}
