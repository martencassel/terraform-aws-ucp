# ---------------------------------------------------------------------------------------------------------------------
# THESE TEMPLATES REQUIRE TERRAFORM VERSION 0.8 AND ABOVE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.9.3"
}

module "ucp-manager" {
  source = "../ucp-manager"

  ucp_version = "3.0.2"
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

