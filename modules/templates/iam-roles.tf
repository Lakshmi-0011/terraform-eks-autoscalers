resource "aws_iam_role" "eks" {
  name = "${var.env}-eks-cluster-role"
  assume_role_policy = file("${path.module}/eks-cluster-assume-role-policy.json")
}

resource "aws_iam_role" "nodes" {
  name = "${var.env}-eks-nodes-role"
  assume_role_policy = file("${path.module}/eks-node-assume-role-policy.json")
}

resource "aws_iam_role" "cluster_autoscaler" {
  name = var.cluster_autoscaler_role_name
  assume_role_policy = file("${path.module}/cluster-autoscaler-assume-role-policy.json")
}
