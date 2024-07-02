resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = var.eks_cluster_role_name
}

resource "aws_eks_cluster" "eks" {
  name     = "${var.env}-eks-cluster"
  version  = var.eks_version
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_role_policy_attachment.eks]
}