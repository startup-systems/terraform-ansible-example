#!/bin/bash

set -e
set -x

if [ ! -z "$AWS_PROFILE" ]; then
  export TF_VAR_profile="$AWS_PROFILE"
fi

cd terraform
terraform init
terraform apply

cd ../ansible
pip install -r requirements.txt
TF_STATE=../terraform/terraform.tfstate ansible-playbook "--inventory-file=$(which terraform-inventory)" provision.yml

echo "Success!"

cd ../terraform
terraform output
