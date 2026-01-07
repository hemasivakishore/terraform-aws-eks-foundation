resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = var.cluster_name
  node_role_arn   = aws_iam_role.eks-ng-role.arn
  node_group_name = "eks-node-group"
  subnet_ids = [
    aws_subnet.no-module-k8s-subnet[0].id,
    aws_subnet.no-module-k8s-subnet[1].id,
    aws_subnet.no-module-k8s-subnet[2].id,
    aws_subnet.no-module-k8s-subnet[3].id,
  ]
  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }
  update_config {
    max_unavailable = 1 # Max unavailable nodes during update
  }

  depends_on = [
    aws_iam_role_policy_attachment.container-registry-readonly,
    aws_iam_role_policy_attachment.eks-cin-policy,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.fargate-execution-polity,
    aws_iam_role_policy_attachment.worker-node-group-policy
  ]
}
