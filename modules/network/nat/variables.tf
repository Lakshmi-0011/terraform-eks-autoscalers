variable "eip-name" {
  type = string
  description = "The name of the elastic ip required for nat gateway"
  default = "eks-eip"
}

variable "nat-name" {
  type = string
  description = "The name of the nat gateway"
  default = "eks-nat"
}

variable "public_subnet_id" {
  type = string
  description = "public subnet id for nat gateway creation"
}

variable "igw_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}