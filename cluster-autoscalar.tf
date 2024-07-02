resource "aws_iam_role_policy_attachment" "cluster_autoscaler" {
  policy_arn = module.templates.cluster_autoscaler_policy_arn
  role       = module.templates.cluster_autoscaler_role_name
}

resource "aws_eks_pod_identity_association" "cluster_autoscaler" {
  cluster_name    = module.eks_cluster.eks_name
  namespace       = "kube-system"
  service_account = var.service_account_name
  role_arn        = module.templates.cluster_autoscaler_role_arn
}

resource "helm_release" "cluster_autoscaler" {
  name = "autoscaler"

  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler"
  namespace  = "kube-system"
  version    = "9.37.0"

  set {
    name  = "rbac.serviceAccount.name"
    value = var.service_account_name
  }

  set {
    name  = "autoDiscovery.clusterName"
    value = module.eks_cluster.eks_name
  }

  # MUST be updated to match your region 
  set {
    name  = "awsRegion"
    value = var.region
  }

  depends_on = [helm_release.metrics_server]
}