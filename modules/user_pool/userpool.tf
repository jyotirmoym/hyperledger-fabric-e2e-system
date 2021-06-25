terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
}

resource "aws_cognito_user_pool" "fabric_user_pool" {

  account_recovery_setting {
    recovery_mechanism {
      name     = "admin_only"
      priority = 1
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  schema {
    name                = "email"
    attribute_data_type = "String"
    mutable             = true
    required            = true

    string_attribute_constraints {
      min_length = 0
      max_length = 50
    }
  }

  schema {
    name                = "family_name"
    attribute_data_type = "String"
    mutable             = true
    required            = true

    string_attribute_constraints {
      min_length = 0
      max_length = 50
    }
  }

  schema {
    name                = "name"
    attribute_data_type = "String"
    mutable             = true
    required            = true

    string_attribute_constraints {
      min_length = 0
      max_length = 50
    }
  }

  schema {
    name                = "phone_number"
    attribute_data_type = "String"
    mutable             = true
    required            = false

    string_attribute_constraints {
      min_length = 0
      max_length = 50
    }
  }

  username_attributes      = ["email"]
  name                     = var.user_pool_name
  auto_verified_attributes = ["email"]

  username_configuration {
    case_sensitive = false
  }
}

resource "aws_cognito_user_pool_client" "fabric_user_pool_client" {
  name = "fabric-user-pool-client"

  user_pool_id    = aws_cognito_user_pool.fabric_user_pool.id
  generate_secret = false

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "minutes"
  }

  access_token_validity                = 5
  refresh_token_validity               = 60
  id_token_validity                    = 5
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes                 = ["email", "openid", "aws.cognito.signin.user.admin"]
  prevent_user_existence_errors        = "ENABLED"
  read_attributes                      = ["email", "family_name", "name", "phone_number"]
  callback_urls                        = ["http://localhost:4200", "http://localhost:4200"]
  explicit_auth_flows                  = ["ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
  write_attributes                     = ["email", "family_name", "name", "phone_number"]
}

resource "aws_cognito_identity_pool" "fabric_user_identity_pool" {
  identity_pool_name               = "fabric-user-identity-pool"
  allow_unauthenticated_identities = false
  allow_classic_flow               = false

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.fabric_user_pool_client.id
    provider_name           = aws_cognito_user_pool.fabric_user_pool.endpoint
    server_side_token_check = true
  }
}

data "aws_iam_policy_document" "cognito_unauth_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"

      values = [aws_cognito_identity_pool.fabric_user_identity_pool.id]
    }
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"

      values = ["unauthenticated"]
    }
  }
}

resource "aws_iam_policy" "cognito_unauth_role_policy" {
  name = "cognito_unauth_role_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["mobileanalytics:PutEvents", "cognito-sync:*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "fabric_user_unauth_role" {
  name                = "cognito_unauth_role"
  assume_role_policy  = data.aws_iam_policy_document.cognito_unauth_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.cognito_unauth_role_policy.arn]
}

data "aws_iam_policy_document" "cognito_auth_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"

      values = [aws_cognito_identity_pool.fabric_user_identity_pool.id]
    }
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"

      values = ["authenticated"]
    }
  }
}

resource "aws_iam_policy" "cognito_auth_role_policy" {
  name = "cognito_auth_role_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["mobileanalytics:PutEvents", "cognito-sync:*", "cognito-identity:*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "fabric_user_auth_role" {
  name                = "cognito_auth_role"
  assume_role_policy  = data.aws_iam_policy_document.cognito_auth_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.cognito_auth_role_policy.arn]
}


resource "aws_cognito_identity_pool_roles_attachment" "fabric_user_identity_pool_attachments" {
  identity_pool_id = aws_cognito_identity_pool.fabric_user_identity_pool.id

  role_mapping {
    identity_provider         = join(":", [aws_cognito_user_pool.fabric_user_pool.endpoint, aws_cognito_user_pool_client.fabric_user_pool_client.id])
    ambiguous_role_resolution = "AuthenticatedRole"
    type                      = "Token"
  }

  roles = {
    "unauthenticated" = aws_iam_role.fabric_user_unauth_role.arn
    "authenticated"   = aws_iam_role.fabric_user_auth_role.arn
  }
}
