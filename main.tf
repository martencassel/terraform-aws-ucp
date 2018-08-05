# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A UCP Manager CLUSTER IN AWS
# These templates show an example of how to use the ucp-cluster module to deploy UCP Managers in AWS.
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.9.3, != 0.9.5"
}


# Configure AWS Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE UCP MANAGER SERVER NODES
# ---------------------------------------------------------------------------------------------------------------------

module "manager_servers" {
  source = "./modules/ucp-cluster"

  number_managers = "1"

  cluster_name = "ucp-test"

  instance_type = "t2.lage"

  # RHEL 7.4
  ami_id = "ami-d74be5b8"

  vpc_id     = "${data.aws_vpc.default.id}"
  subnet_ids = "${data.aws_subnet_ids.default.ids}"

  admin_username = "${var.admin_username}"
  admin_password = "${var.admin_password}"

  package_url = "${var.package_url}"
  rhsm_username = "${var.rhsm_username}"
  rhsm_password = "${var.rhsm_password}"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY UCP MANAGERS IN THE DEFAULT VPC AND SUBNETS
# Using the default VPC and subnets makes this example easy to run and test, but it means UCP Managers is accessible from the
# public Internet. For a production deployment, we strongly recommend deploying into a custom VPC with private subnets.
# ---------------------------------------------------------------------------------------------------------------------

data "aws_vpc" "default" {
  default = "${var.vpc_id == "" ? true : false}"
  id      = "${var.vpc_id}"
}

data "aws_subnet_ids" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_region" "current" {}