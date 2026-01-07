# proider.tf
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"

}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
}

provider "aws" {
  region = var.region
}
