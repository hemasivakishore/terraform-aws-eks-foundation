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
