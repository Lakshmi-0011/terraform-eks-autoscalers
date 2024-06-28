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

variable "az1" {
  type        = string
  description = "Availability Zone 1 for subnet placement."
}

variable "az2" {
  type        = string
  description = "Availability Zone 2 for subnet placement."
}

variable "privatesub1_cidr" {
  type        = string
  description = "CIDR block for private subnet 1."
}

variable "privatesub2_cidr" {
  type        = string
  description = "CIDR block for private subnet 2."
}

variable "publicsub1_cidr" {
  type        = string
  description = "CIDR block for public subnet 1."
}

variable "publicsub2_cidr" {
  type        = string
  description = "CIDR block for public subnet 2."
}

variable "cluster_autoscaler_role_name" {
  type = string
  description = "name of IAM role for cluster autoscaler"
}

variable "cluster_autoscaler_policy_name" {
  type = string
  description = "name of IAM policy for cluster autoscaler"
}

variable "service_account_name" {
  type = string
  description = "name of service account for cluster autoscaler"
}