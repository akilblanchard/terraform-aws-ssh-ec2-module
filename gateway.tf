resource "aws_internet_gateway" "test_env_gw" {
  vpc_id = aws_vpc.test_env.id
}