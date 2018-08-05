output "first_manager_private_ip" {
    value = "${aws_instance.manager.0.private_ip}"
}

output "first_manager_public_dns" {
    value = "${aws_instance.manager.0.public_dns}"
}

output "manager_public_dns_addresses" {
    value = "${aws_instance.manager.*.public_dns}"
}