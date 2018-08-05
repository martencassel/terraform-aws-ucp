
data "template_file" "run_install_ucp" {

  template = "${file("${path.module}/files/run_install.tpl")}"

  vars = {
    ucp_version = "${var.ucp_version}"
    package_url = "${var.package_url}"
    rhsm_username = "${var.rhsm_username}"
    rhsm_password = "${var.rhsm_password}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }
}

resource "aws_instance" "manager" {    
    
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    count = "${var.number_managers}"
    key_name = "${var.ssh_key_name}"

    security_groups =  ["${aws_security_group.allow_all.name}"]

    connection {
        type        = "ssh"
        user        = "${var.provisioning_user}"
        private_key = "${file("${var.provisioning_key}")}"
    }
    
    tags = [
        {
            key = "Name"
            value = "${var.cluster_name}"
        },
        {
            key = "Role"
            value = "manager-${count.index}"
        },
        {
            key = "Version"
            value = "${var.ucp_version}"
        }
    ]

    provisioner "file" {
        source = "${path.module}/../install-ucp/install_ucp.sh"
        destination = "/tmp/install_ucp.sh"
    }

    provisioner "file" {
        content     = "${data.template_file.run_install_ucp.rendered}"
        destination = "/tmp/run_install.sh"
    }
    
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/run_install.sh",
            "/tmp/run_install.sh ${count.index} ${self.private_ip} ${aws_instance.manager.0.private_ip} ${aws_instance.manager.0.public_dns}"
            ]
    }
}


# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP TO CONTROL WHAT REQUESTS CAN GO IN AND OUT OF EACH EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "allow_all" {
  description = "Allow all inbound traffic"

  ingress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_all"
  }
}
