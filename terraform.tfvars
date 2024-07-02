region = "ap-south-1"
env = "dev"
vpc_cidr = "10.5.0.0/16"
eks_version = "1.30"
subnets = [
  {
    cidr_block        = "10.5.1.0/24"
    availability_zone = "ap-south-1a"
    tag_name          = "private-subnet-1"
    map_public_ip_on_launch = false
  },
  {
    cidr_block        = "10.5.2.0/24"
    availability_zone = "ap-south-1b"
    tag_name          = "private-subnet-2"
    map_public_ip_on_launch = false
  },
  {
    cidr_block        = "10.5.3.0/24"
    availability_zone = "ap-south-1a"
    tag_name          = "public-subnet-1"
    map_public_ip_on_launch = true
  },
  {
    cidr_block        = "10.5.4.0/24"
    availability_zone = "ap-south-1b"
    tag_name          = "public-subnet-2"
    map_public_ip_on_launch = true
  }
]
cluster_autoscaler_role_name = "eks-cluster-autoscaler-role"
cluster_autoscaler_policy_name = "eks-cluster-autoscaler-policy"
service_account_name = "cluster-autoscaler"
desired_size = 1
max_size = 10
min_size = 0
