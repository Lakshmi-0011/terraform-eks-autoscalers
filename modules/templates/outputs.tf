output "eks_cluster_role_name" {
  value = aws_iam_role.eks.name
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks.arn
}

output "eks_nodes_role_name" {
  value = aws_iam_role.nodes.name
}

output "eks_nodes_role_arn" {
  value = aws_iam_role.nodes.arn
}

output "cluster_autoscaler_role_name" {
  value = aws_iam_role.cluster_autoscaler.name
}

output "cluster_autoscaler_role_arn" {
  value = aws_iam_role.cluster_autoscaler.arn
}

output "cluster_autoscaler_policy_arn" {
  value = aws_iam_policy.cluster_autoscaler.arn
}