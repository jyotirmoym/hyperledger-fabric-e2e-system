terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "crypto_bucket" {
  bucket = var.crypto_bucket_name

  # This is not recommended to have in production
  force_destroy = true

  tags = {
    Name = var.crypto_bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "crypto_bucket_acl" {
  bucket = aws_s3_bucket.crypto_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_iam_role" "fabric_access_role" {
  name = var.fabric_access_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = [aws_iam_policy.fabric_access_policy.arn, aws_iam_policy.crypto_bucket_access_policy.arn]

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "fabric_access_policy" {
  name = "fabric_access_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action : [
          "managedblockchain:CreateProposal",
          "managedblockchain:GetNetwork",
          "managedblockchain:ListMembers",
          "managedblockchain:GetProposal",
          "managedblockchain:TagResource",
          "managedblockchain:UntagResource",
          "managedblockchain:GetNode",
          "managedblockchain:GetMember",
          "managedblockchain:ListNodes"
        ]
        Effect = "Allow"
        Resource : [
          join(":", ["arn:aws:managedblockchain", data.aws_region.current.name, data.aws_caller_identity.current.account_id, "members/*"]),
          join(":", ["arn:aws:managedblockchain", data.aws_region.current.name, "", "networks/*"]),
          join(":", ["arn:aws:managedblockchain", data.aws_region.current.name, data.aws_caller_identity.current.account_id, "invitations/*"]),
          join(":", ["arn:aws:managedblockchain", data.aws_region.current.name, "", "proposals/*"]),
          join(":", ["arn:aws:managedblockchain", data.aws_region.current.name, data.aws_caller_identity.current.account_id, "nodes/*"])
        ]
      },
    ]
  })
}

resource "aws_iam_policy" "crypto_bucket_access_policy" {
  name = "crypto_bucket_access_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action : ["s3:GetObject"],
        Effect = "Allow"
        Resource : [join("/", [aws_s3_bucket.crypto_bucket.arn, "*"])]
      },
      {
        Action : ["s3:PutObject"],
        Effect = "Allow"
        Resource : [join("/", [aws_s3_bucket.crypto_bucket.arn, "*"])]
      },
      {
        Action : ["s3:ListBucket"],
        Effect = "Allow"
        Resource : [aws_s3_bucket.crypto_bucket.arn]
      }
    ]
  })
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "local_file" "cloud_pem" { 
  filename = "${path.module}/${var.org_name}.pem"
  content = tls_private_key.private_key.private_key_pem
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.private_key.public_key_openssh
}