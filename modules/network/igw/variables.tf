variable "igw-name" {
  type = string
  description = "The name of the internet gateway"
  default = "eks-igw"
}

variable "vpc_id" {
  type = string
  description = "The VPC ID where the Internet Gateway will be created"
}