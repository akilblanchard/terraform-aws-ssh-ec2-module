#Bucket to hold terraform state file
resource "aws_s3_bucket" "state" {
  bucket = var.s3_bucket_name
   force_destroy = var.force_destroy
  tags = {
  Name = "state_bucket"
}
}

#Versioning for State Bucket
resource "aws_s3_bucket_versioning" "state" {
  bucket = var.bucket_name

  versioning_configuration {
    status = var.s3_versioning
  }
}

#Blocking public access to the State Bucket
resource "aws_s3_bucket_public_access_block" "sate" {
  bucket                  = var.s3_bucket_name
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#Enables Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  bucket = var.s3_bucket_name

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.state.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key" "state" {
  description             = "s3 bucket encryption key"
  deletion_window_in_days = 10
}