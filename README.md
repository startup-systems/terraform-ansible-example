# Terraform+Ansible Example

This repository is an example of deploying an provisioning a server on Amazon Web Services (AWS), using [Terraform](https://www.terraform.io/) and [Ansible](http://docs.ansible.com/ansible/). The Terraform part is based on their [Basic Two-Tier AWS Architecture](https://www.terraform.io/intro/examples/aws.html) example.

## Setup

1. Install the following locally:
    * [Terraform](https://www.terraform.io/)
    * [Terraform Inventory](https://github.com/adammck/terraform-inventory)
    * Python 2
1. [Install Ansible](http://docs.ansible.com/ansible/intro_installation.html). The easy way (requires [pip](https://pip.pypa.io/en/stable/installing/)):

    ```sh
    cd ansible
    pip install -r requirements.txt
    cd -
    ```

## Usage

```sh
./deploy.sh
# if you get an SSH connection error the first time this is run, wait a minute or so, and try again
```

Note that `./deploy.sh` is [idempotent](http://stackoverflow.com/questions/1077412/what-is-an-idempotent-operation).
