module "vpc" {
  source = "./modules/network/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source = "./modules/network/subnets"
  vpc_id = module.vpc.vpc_id
  env = var.env
  az1 = var.az1
  az2 = var.az2
  privatesub1_cidr = var.privatesub1_cidr
  privatesub2_cidr = var.privatesub2_cidr
  publicsub1_cidr = var.publicsub1_cidr
  publicsub2_cidr = var.publicsub2_cidr
}

module "igw" {
  source = "./modules/network/igw"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source = "./modules/network/nat"
  public_subnet_id = module.subnet.public_subnet1_id
  igw_id = module.igw.igw_id
  depends_on = [ module.igw ]
}

module "route-table" {
  source = "./modules/network/route-tables"
  private_subnet1_id = module.subnet.private_subnet1_id
  private_subnet2_id = module.subnet.private_subnet2_id
  public_subnet1_id = module.subnet.public_subnet1_id
  public_subnet2_id = module.subnet.public_subnet2_id
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  nat_id = module.nat.nat_gateway_id
}

module "eks_cluster" {
  source = "./modules/eks"
  env = var.env
  eks_version = var.eks_version
  subnet_ids = [module.subnet.private_subnet1_id, module.subnet.private_subnet2_id, module.subnet.public_subnet1_id, module.subnet.public_subnet2_id]
  private_subnet_ids = [module.subnet.private_subnet1_id, module.subnet.private_subnet2_id]
}

# output "eks_certification" {
#   value = module.eks_cluster.certificate_authority
# }

# output "eks_endpoint" {
#   value = module.eks_cluster.endpoint
# }

output "eks_name" {
  value = module.eks_cluster.eks_name
}
