# UCP Cluster

This folder contains a Terraform module to deploy 
```

module "ucp-cluster" {
    ami_id = "ami-c86c3f23"
}

```

## How do you use this module?

This folder defines a Terraform module, which you can use in your code by adding a `module` configuration and setting its `source` parameter to URL of this folder:

```hcl
module "ucp-cluster" {
    source = "github.com/martencassel/terraform-aws-ucp//modules/ucp-cluster"
    ami_id = "ami-c86c3f23"
}
```

Note the following parameters:

* `ami_id`: Use this parameter to specify the ID of supported [Amazon Machine Image
  [(AMI)](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) OS distribution [(UCP)](https://success.docker.com/article/compatibility-matrix)

## How do you connect to the UCP custer ? 

### Using the HTTP API from your own computer

### Using your browser from your own computer

### What's included in this module ? 

This architecture consists of the following resources:


