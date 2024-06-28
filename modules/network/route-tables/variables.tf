variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created"
  type        = string
}

variable "igw_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "nat_id" {
  description = "The ID of the NAT Gateway"
  type        = string
}

variable "default_cidr_block" {
  type        = string
  description = "Default CIDR block for routing purposes"
  default     = "0.0.0.0/0"
}

variable "private_subnet1_id" {
  description = "The ID of the first private subnet to be associated with private route table"
  type        = string
}

variable "private_subnet2_id" {
  description = "The ID of the second private subnet to be associated with private route table"
  type        = string
}

variable "public_subnet1_id" {
  description = "The ID of the first public subnet to be associated with public route table"
  type        = string
}

variable "public_subnet2_id" {
  description = "The ID of the second public subnet to be associated with public route table"
  type        = string
}
