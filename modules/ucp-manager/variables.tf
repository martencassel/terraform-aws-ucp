# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "cluster_name" {
  description = "The name of the UCP cluster (e.g. ucp-stage). This variable is used to namespace all resources created by this module."
}
variable "ami_id" {
    description = "The ID of the AMI to run in this cluster."
}
variable "vpc_id" {
  description = "The ID of the VPC in which to deploy the UCP cluster"
}
variable "package_url" {
    description = "The package url from the Docker EE repo"
}
variable "rhsm_username" {    
    description = "RHSM username to register RHEL"
}
variable "rhsm_password" {
    description = "The RHSM password to register RHEL"
}
variable "admin_username" {
    description = "The superuser username of UCP"
}
variable "admin_password" {
    description = "The superuser password of UCP"
}
# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "instance_type" {
    description = "The type of EC2 Instances to run for each node in the cluster (e.g. t2.large)."
    default = "t2.large"
}
variable "number_managers" {
    description = "The number of manager nodes"
    default = 1
}
variable "ucp_version" {
    description = "The UCP version to install"
    default = "3.0.0"
}
variable "ssh_key_name" {
    type = "string"
    default = "terraform"
}
variable "ssh_port" {
    description = "The port used for SSH connections"
    default = "22"
}
variable "provisioning_user" {
    description = "The username used to SSH by the provisioner"
    default = "ec2-user"
}
variable "provisioning_key" {
    description = "The private key used to SSH by the provisioner"
    default = "~/aws/terraform.pem"
}