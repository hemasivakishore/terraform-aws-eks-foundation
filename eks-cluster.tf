resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks-role.arn
  version  = var.k8s_version
  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids = [
      aws_subnet.no-module-k8s-subnet[0].id,
      aws_subnet.no-module-k8s-subnet[1].id,
      aws_subnet.no-module-k8s-subnet[4].id,
      aws_subnet.no-module-k8s-subnet[5].id,
    ]
  }
  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }
  bootstrap_self_managed_addons = true
  tags                          = merge(var.tags, { "Name" = var.cluster_name }, { "eks_version" = var.eks_version })
  upgrade_policy {
    support_type = "STANDARD"
  }
  depends_on = [aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy]
}
