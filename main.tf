module "vpc" {
  source = "./modules/network/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source = "./modules/network/subnets"
  vpc_id = module.vpc.vpc_id
  env = var.env
  subnets = var.subnets
}

module "igw" {
  source = "./modules/network/igw"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source = "./modules/network/nat"
  igw_id = module.igw.igw_id
  public_subnet_ids = module.subnets.public_subnet_ids
}

module "route-table" {
  source = "./modules/network/route-tables"
  vpc_id = module.vpc.vpc_id
  nat_ids = module.nat.nat_gateway_ids
  igw_id = module.igw.igw_id
  private_subnet_ids = module.subnets.private_subnet_ids
  public_subnet_ids = module.subnets.public_subnet_ids
}

module "templates" {
  source = "./modules/templates"
  cluster_autoscaler_policy_name = var.cluster_autoscaler_policy_name
  env = var.env
  cluster_autoscaler_role_name = var.cluster_autoscaler_role_name
}

module "eks_cluster" {
  source = "./modules/eks"
  env = var.env
  eks_version = var.eks_version
  subnet_ids = module.subnets.subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids
  eks_cluster_role_arn = module.templates.eks_cluster_role_arn
  eks_cluster_role_name = module.templates.eks_cluster_role_name
  eks_nodes_role_arn = module.templates.eks_nodes_role_arn
  eks_nodes_role_name = module.templates.eks_nodes_role_name
  desired_size = var.desired_size
  max_size = var.max_size
  min_size = var.min_size
}

output "eks_name" {
  value = module.eks_cluster.eks_name
}

