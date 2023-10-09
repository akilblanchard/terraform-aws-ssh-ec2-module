variable "key_pair_name" {
  description = "Key Pair for ssh access to instance"
  type        = string
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}
variable "instance_tag"{
  description = "Tag(s) for Instance(s)"
  type = list(string)
}
variable "ec2_instance_name" {
  type        = string
  description = "The name to give the instance."
}

variable "counter" {
  description = "Number of instances to launch"
  type        = number
}

variable "file_name" {
  description = "Name of the key pair file"
  type        = string
}

variable "cidr_block" { 
  description = "CIDR Block"
  type = string
}

variable "availability_zone"{
  description = "Availability Zones for the Subnet"
  type = string
}
