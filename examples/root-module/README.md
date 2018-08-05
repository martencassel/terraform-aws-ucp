# UCP Cluster Example

This folder shows an example of Terraform code that uses the [ucp-cluster] (https://github.com/martencassel/terraform-aws-ucp/tree/master/modules/ucp-cluster) module to deploy a UCP Manager cluster in AWS(https://aws.amazon.com). 

## Quick start

To deploy a UCP Manager Cluster:

1. `git clone` this repo to your computer.
1. Install [Terraform](https://terraform.io).
1. Open `variables.tf`, set the environment variables specified at the top of the file, and fill in any other variables that don't have a default. 
1. Run `terraform init`.
1. Run `terraform apply`.

