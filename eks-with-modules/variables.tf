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
