variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created"
  type        = string
}

variable "env" {
  type = string
  description = "Environment name (e.g., 'dev', 'prod')."
}

variable "privatesub1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
}

variable "privatesub2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
}

variable "publicsub1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "publicsub2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
}

variable "az1" {
  description = "The availability zone for the first set of subnets"
  type        = string
}

variable "az2" {
  description = "The availability zone for the second set of subnets"
  type        = string
}

variable "privatesubnet1-name" {
  description = "The name of the first private subnet"
  type        = string
  default     = "eks-private-subnet1"
}

variable "privatesubnet2-name" {
  description = "The name of the second private subnet"
  type        = string
  default     = "eks-private-subnet2"
}

variable "publicsubnet1-name" {
  description = "The name of the first public subnet"
  type        = string
  default     = "eks-public-subnet1"
}

variable "publicsubnet2-name" {
  description = "The name of the second public subnet"
  type        = string
  default     = "eks-public-subnet2"
}
