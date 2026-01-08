# proider.tf
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

# #provider.tf
# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       #version = ">= 5.79, < 6.0.0"
#       version = "~> 5.100.0"
#     }
#   }
# }

# provider "aws" {
#   region = var.region
# }
