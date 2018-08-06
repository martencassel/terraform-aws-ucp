resource "null_resource" "example1" {
    provisioner "local-exec" {
        command = "echo ${var.manager_ip} >> private_ips.txt"
    }
}

resource "aws_instance" "ucp_linux_worker" {
    
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    count = "${ var.number_linux_workers == 0 ? 0: var.number_linux_workers}"
    key_name = "${var.ssh_key_name}"

    tags = {
        Name    = "linworker-${count.index}"
        Version = "${var.ucp_version}"
    }

    connection {
        type        = "ssh"
        user        = "${var.provisioning_user}"
        private_key = "${file("${var.provisioning_key}")}"
    }
}

resource "aws_instance" "ucp_windows_worker" {

  ami        = "ami-63f5c688"
  instance_type = "${var.instance_type}"
  count = "${ var.number_windows_workers == 0 ? 0: var.number_windows_workers}"
  key_name =  "${var.ssh_key_name}"

  tags = {
        Name    = "winworker-${count.index}"
        Version = "${var.ucp_version}"
  }

  connection {
    type     = "winrm"
    user     = "Administrator"
    password = "${var.windows_admin_password}"
    timeout  = "10m"
  }
  
}