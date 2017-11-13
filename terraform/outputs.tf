output "address" {
  value = "${aws_instance.web.public_ip}"
}

output "ssh" {
  value = "ssh ${local.vm_user}@${aws_instance.web.public_ip}"
}
