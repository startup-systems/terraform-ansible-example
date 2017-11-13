# Specify the provider and access details
provider "aws" {
  version = "~> 1.0"
  profile = "${var.profile}"
  region = "${var.region}"
}
