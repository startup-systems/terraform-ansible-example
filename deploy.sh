#!/bin/bash

set -e
set -x

cd terraform
terraform init
terraform apply -auto-approve

cd ../ansible
pip install -r requirements.txt
TF_STATE=../terraform/terraform.tfstate ansible-playbook "--inventory-file=$(which terraform-inventory)" provision.yml

echo "Success!"

cd ../terraform
terraform output
