resource "aws_subnet" "subnet" {
  count             = length(var.subnets)
  cidr_block        = var.subnets[count.index].cidr_block
  vpc_id            = var.vpc_id
  availability_zone = var.subnets[count.index].availability_zone
  map_public_ip_on_launch = var.subnets[count.index].map_public_ip_on_launch

  tags = {
    Name    = var.subnets[count.index].tag_name
    "kubernetes.io/cluster/${var.env}-eks-cluster" = "owned"
    "kubernetes.io/role/${var.subnets[count.index].map_public_ip_on_launch ? "elb" : "internal-elb"}" = "1"
  }
}