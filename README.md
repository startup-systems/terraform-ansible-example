# Terraform+Ansible Example

This repository is the near-simplest example of deploying an provisioning a web server on Amazon Web Services (AWS), using [Terraform](https://www.terraform.io/) and [Ansible](http://docs.ansible.com/ansible/). Based on:

* [Terraform's Basic Two-Tier AWS Architecture](https://www.terraform.io/intro/examples/aws.html) example
* [AWS's VPC with a Single Public Subnet](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario1.html) example

## Details

This repository sets up:

* A VPC
* A subnet
* An internet gateway
* A security group
* An SSH key pair
* A publicly-accessible EC2 instance
* Within the instance:
   * Python 2 (for Ansible)
   * Nginx

## Setup

1. Install the following locally:
    * [Terraform](https://www.terraform.io/) >= 0.10.0
    * [Terraform Inventory](https://github.com/adammck/terraform-inventory)
    * Python (see [requirements](https://docs.ansible.com/ansible/latest/intro_installation.html#control-machine-requirements))
    * [pip](https://pip.pypa.io/en/stable/installing/)
1. Set up AWS credentials in [`~/.aws/credentials`](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files).
    * The easiest way to do so is by [setting up the AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html).
1. Ensure you have an SSH public key at `~/.ssh/id_rsa.pub`.
    * [How to generate](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

## Usage

```sh
export AWS_DEFAULT_REGION=us-east-1
pip install -r requirements.txt

./deploy.sh
```

[More information about the AWS environment variables](https://www.terraform.io/docs/providers/aws/#environment-variables). If it is successful, you should see an `address` printed out at the end. Visit this in your browser, and the page should say "Welcome to nginx!"

### Notes

* `./deploy.sh` is [idempotent](http://stackoverflow.com/questions/1077412/what-is-an-idempotent-operation).
* [Information](https://www.terraform.io/intro/getting-started/variables.html#assigning-variables) about overriding [the Terraform variables](terraform/vars.tf).

## Cleanup

```sh
cd terraform
terraform destroy
```
