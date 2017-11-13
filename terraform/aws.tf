# Specify the provider and access details
provider "aws" {
  version = "~> 1.0"
}

data "aws_region" "current" {
  current = true
}
