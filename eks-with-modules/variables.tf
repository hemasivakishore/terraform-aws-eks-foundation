variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "cidr-block" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.10.0.0/16"
}

variable "tags" {
  type = map(string)
  default = {
    terraform  = "true"
    kubernetes = "module-eks-cluster"
  }
  description = "values to add to all resources as tags"
}

variable "vpc-name" {
  type        = string
  description = "The name of the VPC"
  default     = "eks-tf-vpc"
}


# EKS Cluster Variables
variable "cluster_name" {
  type        = string
  default     = "hsk-eks"
  description = "EKS Cluster Name"
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes Version for EKS Cluster"
  default     = "1.31"
}

variable "eks_version" {
  type        = string
  description = "EKS Version"
  default     = "1.31"
}

variable "admin_username" {
  type        = string
  description = "The admin username for the EKS cluster"
  default     = "admin"
}
