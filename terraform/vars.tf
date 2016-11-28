variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "aws_amis" {
  # Ubuntu Server 16.04 LTS (HVM), SSD Volume Type
  default = {
    us-east-1 = "ami-40d28157"
    us-east-2 = "ami-153e6470"
  }
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  default = "terraform-ansible-example-key"
}

variable "vm_user" {
  default = "ubuntu"
}

variable "tags" {
  type = "map"
  default = {
    Repo = "https://github.com/startup-systems/terraform-ansible-example"
    Terraform = true
  }
}
