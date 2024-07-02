variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created"
  type        = string
}

variable "igw_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "nat_ids" {
  description = "List of NAT Gateway IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "list of public subnet IDs"
  type = list(string)
}

variable "default_cidr_block" {
  type        = string
  description = "Default CIDR block for routing purposes"
  default     = "0.0.0.0/0"
}

