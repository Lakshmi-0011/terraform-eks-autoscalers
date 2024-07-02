variable "region" {
  type        = string
  description = "Specify the AWS region where you want to create the resources."
}



variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "env" {
  type        = string
  description = "Environment name (e.g., 'dev', 'prod')."
}

variable "eks_version" {
  type        = string
  description = "Version of Amazon EKS to use for the cluster."
}

variable "subnets" {
  type = list(object({ 
    cidr_block        = string
    availability_zone = string
    tag_name          = string
    map_public_ip_on_launch = bool
  }))
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

variable "service_account_name" {
  type = string
  description = "name of service account for cluster autoscaler"
}

variable "cluster_autoscaler_role_name" {
  type = string
}

variable "cluster_autoscaler_policy_name" {
  description = "name for cluster autoscaler policy to be created"
  type = string
}