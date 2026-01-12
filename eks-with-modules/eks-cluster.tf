module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.11.0"

  name               = var.cluster_name
  kubernetes_version = var.k8s_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  service_ipv4_cidr = "172.20.0.0/16"

  endpoint_private_access = true
  endpoint_public_access  = true

  authentication_mode = "API"

  enable_irsa = true

  enabled_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  tags = {
    Environment = "prod"
    ManagedBy   = "terraform"
  }
}

module "eks_managed_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "21.11.0"

  name         = "${var.cluster_name}-workers"
  cluster_name = module.eks.cluster_name

  subnet_ids           = module.vpc.private_subnets
  cluster_service_cidr = module.eks.cluster_service_cidr

  instance_types = ["t3.large"]
  capacity_type  = "ON_DEMAND"

  min_size     = 1
  max_size     = 5
  desired_size = 2

  labels = {
    role = "worker"
  }

  tags = {
    Environment = "prod"
    NodeGroup   = "primary"
  }
}
