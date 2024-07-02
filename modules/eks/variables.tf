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

variable "desired_size" {
  type        = number
  description = "The desired number of instances in the Auto Scaling group of eks nodegroup"
}

variable "max_size" {
  type        = number
  description = "The maximum number of instances in the Auto Scaling group of eks nodegroup"
}

variable "min_size" {
  type        = number
  description = "The minimum number of instances in the Auto Scaling group of eks nodegroup"
}

variable "eks_cluster_role_name" {
  type = string
  description = "name of the role need to be assigned to eks cluster"
}

variable "eks_cluster_role_arn" {
  type = string
  description = "arn of the role need to be assigned to eks cluster"
}

variable "eks_nodes_role_name" {
  type = string
  description = "name of the role need to be assigned to eks cluster"
}

variable "eks_nodes_role_arn" {
  type = string
  description = "arn of the role need to be assigned to eks cluster"
}
