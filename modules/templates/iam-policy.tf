resource "aws_iam_policy" "cluster_autoscaler" {
  name = var.cluster_autoscaler_policy_name
  policy = file("${path.module}/cluster-nodes-autoscaling-policy.json")
}