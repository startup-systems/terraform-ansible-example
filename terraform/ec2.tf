locals {
  # The default username for our AMI
  vm_user = "ubuntu"
}

# Get the latest Ubuntu Xenial AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "inst" {
  instance_type = "m3.xlarge"
  tags = "${merge(map("Name", "${var.name}"), "${var.tags}")}"
  ami = "${data.aws_ami.ubuntu.id}"
  subnet_id = "subnet-02cb3074"
  associate_public_ip_address = "true"
  # The name of our SSH keypair
  key_name = "${var.key_name}"

  root_block_device {
    volume_size = "180"
  }

# Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["sg-102d636c"]

  # force Terraform to wait until a connection can be made, so that Ansible doesn't fail when trying to provision
  provisioner "remote-exec" {
    # The connection will use the local SSH agent for authentication
    inline = ["echo Successfully connected"]

    # The connection block tells our provisioner how to communicate with the resource (instance)
    connection {
      user = "${local.vm_user}"
    }
  }
}
