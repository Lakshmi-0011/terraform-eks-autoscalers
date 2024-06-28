resource "aws_subnet" "private-subnet-1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.privatesub1_cidr
  availability_zone = var.az1

  tags = {
    "Name"                            = var.privatesubnet1-name
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.env}-eks-cluster"      = "owned"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.privatesub2_cidr
  availability_zone = var.az2

  tags = {
    "Name"                            = var.privatesubnet2-name
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.env}-eks-cluster"       = "owned"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.publicsub1_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = var.publicsubnet1-name
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/${var.env}-eks-cluster"  = "owned"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.publicsub2_cidr
  availability_zone       = var.az2
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = var.publicsubnet2-name
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/${var.env}-eks-cluster"  = "owned"
  }
}