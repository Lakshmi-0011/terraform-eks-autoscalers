variable "env" {
  type        = string
  description = "Specify the environment for the resources (e.g., dev, test, prod)"
}

variable "eks_version" {
  description = "The EKS version to use"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}
