output "certificate_authority" {
  value = aws_eks_cluster.eks.certificate_authority
}

output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "eks_name" {
  value = aws_eks_cluster.eks.name
}

