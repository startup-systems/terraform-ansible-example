output "address" {
  value = "${aws_instance.web.public_ip}"
}

output "ssh" {
  value = "ssh ${var.vm_user}@${aws_instance.web.public_ip}"
}
