resource "aws_internet_gateway" "eks-igw" {
  vpc_id = aws_vpc.k8s-vpc-no-module.id
  tags   = var.tags
}