terraform {
  backend "s3" {
    bucket         = "terraform-eks-autoscaling-demo-backend"
    key            = "eks-autoscaling/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}