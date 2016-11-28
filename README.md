# Terraform+Ansible Example

This repository is an example of deploying an provisioning a server on Amazon Web Services (AWS), using [Terraform](https://www.terraform.io/) and [Ansible](http://docs.ansible.com/ansible/). The Terraform part is based on their [Basic Two-Tier AWS Architecture](https://www.terraform.io/intro/examples/aws.html) example.

## Setup

1. Install the following locally:
    * [Terraform](https://www.terraform.io/)
    * [Terraform Inventory](https://github.com/adammck/terraform-inventory)
    * Python 2
    * [pip](https://pip.pypa.io/en/stable/installing/)
1. Set up AWS credentials. The easiest way to do so is by [setting up the AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html).

## Usage

```sh
./deploy.sh
```

Note that `./deploy.sh` is [idempotent](http://stackoverflow.com/questions/1077412/what-is-an-idempotent-operation).

If you have [multiple AWS accounts/profiles](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles), run with

```sh
AWS_PROFILE=something ./deploy.sh
```

You can then override [the `profile` variable (and others)](terraform/vars.tf) to match using [a `terraform.tfvars` file](https://www.terraform.io/docs/configuration/variables.html#variable-files) under the `terraform/` directory.
