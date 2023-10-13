#VPC Resource

resource "aws_vpc" "test_env" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "test_env"
  }
}