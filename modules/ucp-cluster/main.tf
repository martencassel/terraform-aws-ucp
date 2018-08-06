# ---------------------------------------------------------------------------------------------------------------------
# THESE TEMPLATES REQUIRE TERRAFORM VERSION 0.8 AND ABOVE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.9.3"
}

module "ucp-manager" {

  source = "../ucp-manager"

  ucp_version = "${var.ucp_version}"
  number_managers = "${var.number_managers}"

  cluster_name = "${var.cluster_name}"
  
  ami_id = "${var.ami_id}"
  vpc_id = "${var.vpc_id}"

  package_url = "${var.package_url}"

  rhsm_username = "${var.rhsm_username}"
  rhsm_password = "${var.rhsm_password}"
  admin_username = "${var.admin_username}"
  admin_password = "${var.admin_password}"
}
 
module "ucp-worker" {
  source = "../ucp-worker"

  ucp_version = "${var.ucp_version}"

  number_linux_workers = 1  
  number_windows_workers = 1

  manager_ip = "${module.ucp-manager.first_manager_private_ip}"
  manager_public_dns = "${module.ucp-manager.first_manager_public_dns}"  

  ami_id = "${var.ami_id}"
  vpc_id = "${var.vpc_id}"

  package_url = "${var.package_url}"

  rhsm_username = "${var.rhsm_username}"
  rhsm_password = "${var.rhsm_password}"
  admin_username = "${var.admin_username}"
  admin_password = "${var.admin_password}"
}
