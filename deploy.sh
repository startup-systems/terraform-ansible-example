#!/bin/bash

set -e
set -x

if [ ! -z "$AWS_PROFILE" ]; then
  export TF_VAR_profile="$AWS_PROFILE"
fi

cd terraform
#terraform init
terraform apply

cd ../ansible
sudo pip install -r requirements.txt
ANSIBLE_HOST_KEY_CHECKING=False TF_STATE=../terraform/terraform.tfstate ansible-playbook --inventory-file=$(which terraform-inventory) provision.yml -b

echo "Success!"

cd ../terraform
terraform output
