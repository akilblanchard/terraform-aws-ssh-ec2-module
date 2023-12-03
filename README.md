# Terraform AWS Ssh Ec2 Access Module

This Terraform module creates a vpc consisting of a Subnet with an internet gateway attached to it, a security group that allows for ssh access, routing tables, allows you to specify the amount of instances needed for launch and each instance will be equipped with the latest version of Ubuntu 20.04
The module will also provide the capability to store the Terraform tfstate file in an s3 bucket coupled with a DynamoDB Table for state locking


Below I will break down the usage for this module

# Usage for just launching ec2 instances and having the Terraform State file stored in an S3 bucket

When using this run the module first then uncomment the backend block and migrate the tfstate file to the s3 bucket.
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

#Outputs

output "kms_key" {
  value       = module.test_env_module.kms_key
}

output "instance_public_ip" {
  value       = module.test_env_module.instance_public_ip[*]
}

output "instance_private_ip" {
    value = module.test_env_module.instance_private_ip[*]
  
}
```

# Providers
| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.18.1 |

