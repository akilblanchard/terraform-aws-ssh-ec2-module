#-----------------
#General Variables
#-----------------
variable "availability_zone" {
  description = "Availability Zones for the Subnet"
  type        = string
}

variable "aws_region"{
  description = "region"
  type = string
}

#------------------
#Key Pair Variables
#------------------
variable "key_pair_name" {
  description = "Key Pair for ssh access to instance"
  type        = string
}

variable "file_name" {
  description = "Name of the key pair file"
  type        = string
}

#------------------
#Instance Variables
#------------------
variable "instance_type" {
  description = "Instance Type"
  type        = string
}
variable "instance_tag" {
  description = "Tag(s) for Instance(s)"
  type        = list(string)
}
variable "ec2_instance_name" {
  type        = string
  description = "The name to give the instance."
}

variable "counter" {
  description = "Number of instances to launch"
  type        = number
}

#----------------
#Subnet Variables
#----------------
variable "cidr_block" {
  description = "CIDR Block"
  type        = string
}

#--------------
# s3 Variables
#--------------
variable "s3_bucket_name" {
  description = "Name of bucket that holds the state file"
  type        = string
}

variable "s3_versioning" {
  description = "Versioning for bucket"
  type        = string
}

variable "force_destroy" {
  description = "Force destroy the bucket"
  type = bool
}

# -------------------------------------------
# DynamoDB Variables
# -------------------------------------------
variable "db_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = null
}

variable "hash_key" {
  description = "DynamoDB hash ke"
  type        = string
  default     = "LockID"
}

variable "attr_name" {
  description = "DynamoDB attribute name"
  type        = string
  default     = "LockID"
}

variable "attr_type" {
  description = "DynamoDB attribute type"
  type        = string
  default     = "S"
}