provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

# resource "aws_s3_bucket_versioning" "bucket_versioning" {
#   bucket = aws_s3_bucket.bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

resource "aws_dynamodb_table" "terraform_lock" {
  name           = var.dynamo_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}