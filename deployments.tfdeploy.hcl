# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

deployment "development" {
  variables = {
    regions             = ["us-east-1"]
    role_arn            = "arn:aws:iam::285942769742:role/tfc-workload-identity"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

#Added this 2-23-2024 with us-west-2 with name QA
deployment "qa2" {
  variables = {
    regions             = ["us-west-2"]
    role_arn            = "arn:aws:iam::285942769742:role/tfc-workload-identity"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

#Added this 3-14-2024 with us-east-2 with name QA
deployment "pre-prod" {
  variables = {
    regions             = ["us-east-2"]
    role_arn            = "arn:aws:iam::285942769742:role/tfc-workload-identity"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}


deployment "production" {
  variables = {
    regions             = ["us-east-1", "us-west-1"]
    role_arn             = "arn:aws:iam::285942769742:role/tfc-workload-identity"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

