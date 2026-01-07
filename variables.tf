variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

# Kubernetes VPC Variables

variable "cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default = {
    name      = "terraform-vpc"
    terraform = "yes"
    cluster   = "demo-eks-cluster"
  }
}

# IAM Role Variables
variable "eks_role_name" {
  type        = string
  description = "Name of the EKS IAM Role"
  default     = "tf-eks-role"
}

# EKS Cluster Variables
variable "cluster_name" {
  type        = string
  default     = "hsk-eks-cluster"
  description = "EKS Cluster Name"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes Version for EKS Cluster"
  default     = "1.32"
}

variable "eks_version" {
  type        = string
  description = "EKS Version"
  default     = "1.32"
}
