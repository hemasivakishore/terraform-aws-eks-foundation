# Complete EKS Cluster with Managed Node Groups
# Compatible with terraform-aws-modules/eks/aws v21.11.0

locals {
  cluster_name = "my-eks-cluster" # Override with var.cluster_name
  environment  = "prod"           # Override with var.environment
}

# Data sources
data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.11.0"

  cluster_name    = var.cluster_name
  cluster_version = var.k8s_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # API access
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  # Control plane logging (prod-safe minimum)
  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator"
  ]

  # Security
  enable_irsa    = true
  create_kms_key = false

  tags = var.tags
}


module "eks_managed_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "21.11.0"

  name         = "prod-workers"
  cluster_name = module.eks.cluster_name

  subnet_ids = module.vpc.private_subnets

  instance_types = ["t3.large"]
  capacity_type  = "ON_DEMAND"

  min_size     = 2
  max_size     = 5
  desired_size = 2

  tags = merge(var.tags, {
    Role = "worker"
  })
}
