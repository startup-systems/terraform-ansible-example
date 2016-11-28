# Specify the provider and access details
provider "aws" {
  profile = "${var.profile}"
  region = "${var.region}"
}
