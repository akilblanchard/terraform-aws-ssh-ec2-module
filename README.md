# terraform-aws-ssh-ec2-module Terrafrom AWS SSH EC2 Access

This Terraform module creates a vpc consisting of a Subnet with an internet gateway attached to it, a security group that allows for ssh access, routing tables and allows you to specify the amount of instances needed for launch.

Each Instance comes equppied with the latest version of Ubuntu 20.04

# usage
```
module "test_env_module" {
  source = "github.com/akilblanchard/terraform-aws-ssh-ec2-module.git"

  aws_region        = "us-east-1"
  file_name         = "tf_key"
  ec2_instance_name = "test"
  key_pair_name     = "tfkey"
  cidr_block        = "10.0.0.0/16"
  counter           = 2
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  instance_tag      = ["main_server", "test_server", "test_server"]
  s3_bucket_name    = "ab-tf-statelck"
  s3_versioning     = "Enabled"
  force_destroy = true
  db_table_name     = "tf-state-db"

}

#terraform {
 # backend "s3" {
  #  bucket                  = "ab-tf-statelck"
  #  key                     = "s3-backend/terraform.tfstate"
  #  region                  = "us-east-1"
  #  dynamodb_table          = "tf-state-db"
  #  encrypt                 = true
  #  shared_credentials_file = "~/.aws/credentials"
  #  profile                 = "default"
# }
#}

output "instance_public_ip" {
  description = "Public Ip of the EC2 instance(s)"
  value       = module.test_env_module.instance_public_ip
}
```
# Providers
| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.18.1 |

