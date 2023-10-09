output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.test_env_ec2[*].id
}

output "instance_public_ip" {
  description = "Public Ip of the EC2 instance(s)"
  value       = aws_instance.test_env_ec2[*].public_ip
}


output "instance_private_ip" {
  description = "Private Ip of the EC2 instance(s)"
  value       = aws_instance.test_env_ec2[*].private_ip
}