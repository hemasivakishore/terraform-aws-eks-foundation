resource "aws_iam_role" "fargate-profile-role" {
  name = "fatgate-profile-role"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}


resource "aws_iam_role_policy_attachment" "fargate-execution-polity" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.fargate-profile-role.name
}

resource "aws_eks_fargate_profile" "eks-fargate-profile" {
  cluster_name           = aws_eks_cluster.eks-cluster.name
  fargate_profile_name   = "fg-profile"
  pod_execution_role_arn = aws_iam_role.fargate-profile-role.arn
  selector {
    namespace = "kube-system"
  }
  selector {
    namespace = "default"
  }

  subnet_ids = [
    aws_subnet.no-module-k8s-subnet[4].id,
    aws_subnet.no-module-k8s-subnet[5].id,
  ]
  depends_on = [aws_iam_role_policy_attachment.fargate-execution-polity]
}
