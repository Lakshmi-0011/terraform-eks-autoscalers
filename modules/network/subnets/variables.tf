variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created"
  type        = string
}

variable "env" {
  type = string
  description = "Environment name (e.g., 'dev', 'prod')."
}

variable "subnets" {
  description = "List of subnet configurations"
  type = list(object({
    cidr_block        = string
    availability_zone = string
    tag_name          = string
    map_public_ip_on_launch = bool
  }))
}
