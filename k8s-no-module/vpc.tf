resource "aws_vpc" "k8s-vpc-no-module" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags                 = merge(var.tags, { Name = "K8S-VPC" })
}