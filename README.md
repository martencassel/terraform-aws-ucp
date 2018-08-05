# UCP AWS Module

## How to use this Module

* [root](https://github.com/martencassel/terraform-aws-ucp/tree/master): This folder shows an example of Terraform code that uses the [ucp-cluster](https://github.com/martencassel/terraform-aws-ucp/tree/master/modules/ucp-cluster) module to deploy a cluster in [AWS](https://aws.amazon.com/).

* [modules](https://github.com/martencassel/terraform-aws-ucp/tree/master): This folder contains the reusable code for this Module, broken down into one or more modules.

* [examples](https://github.com/martencassel/terraform-aws-ucp/tree/master/examples): This folder contains examples of how to use the modules.

## Code included in this Module:

* [install-ucp](https://github.com/martencassel/terraform-aws-ucp/tree/master/modules/install-ucp): This module installs UCP Manager cluster including a specified Dokcker EE engine version on a RHEL AMI Instance.

* [ucp-cluster](https://github.com/martencassel/terraform-aws-ucp/tree/master/modules/ucp-cluster): The module includes Terraform code to deploy a UCP manager cluster.