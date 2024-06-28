resource "aws_eks_addon" "pod_identity" {
  cluster_name  = module.eks_cluster.eks_name
  addon_name    = "eks-pod-identity-agent"
  addon_version = "v1.2.0-eksbuild.1"
}