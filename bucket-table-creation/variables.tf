variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket where Terraform will store its state file."
  default = "terraform-eks-autoscaling-demo-backend"
}

variable "dynamo_table_name" {
  type        = string
  description = "Optional. The name of the DynamoDB table used for state locking to prevent concurrent modifications."
  default = "terraform-lock"
}

variable "region" {
  type        = string
  description = "The AWS region where the S3 bucket and optionally DynamoDB table are located."
  default = "ap-south-1"
}
