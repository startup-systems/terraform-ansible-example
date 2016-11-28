output "address" {
  value = "${aws_elb.web.dns_name}"
}

output "ssh" {
  value = "ssh ${var.vm_user}@${aws_instance.web.public_ip}"
}
