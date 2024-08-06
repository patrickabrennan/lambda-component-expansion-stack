# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    regions             = ["us-east-1"]
    role_arn            = "arn:aws:iam::285942769742:role/hcp-oidc"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions             = ["us-east-1", "us-west-1"]
    role_arn            = "arn:aws:iam::285942769742:role/hcp-oidc"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

