resource "aws_dynamodb_table" "state" {
  name         = var.db_table_name
  billing_mode = "PAY_PER_REQUEST" 
  hash_key     = var.hash_key     #"LockID"

  attribute {
    name = var.attr_name #"LockId"
    type = var.attr_type #"S"
  }
}