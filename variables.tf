# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "ami_id" {
  description = ""
  default     = "ami-d74be5b8"
}
variable "ucp_version" {
  description = "The ucp version"
  default = "3.0.0"
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
variable "cluster_name" {
  description = "The cluster name."
}

variable "number_managers" {
  description = "The number of managers to deploy."
  default     = 1
}
variable "region" {}
variable "access_key" {}
variable "secret_key" {}
variable "private_key_path" {
  default = "~/aws/terraform.pem"
}
variable "vpc_id" {
  description = "The ID of the VPC in which nodes will be deployed. Use default VPC if not supplied."
  default = ""
}