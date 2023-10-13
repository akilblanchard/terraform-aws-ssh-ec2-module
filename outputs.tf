output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.test_env_module.instance_id
}

output "instance_public_ip" {
  description = "Public Ip of the EC2 instance(s)"
  value       = module.test_env_module.public_private_ip
}


output "instance_private_ip" {
  description = "Private Ip of the EC2 instance(s)"
  value       = module.test_env_module.instance_private_ip
}

output "instance_public_ip" {
  description = "Public Ip of the EC2 instance(s)"
  value       = module.test_env_module.instance_public_ip
}