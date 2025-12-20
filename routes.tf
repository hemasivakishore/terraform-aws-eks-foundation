resource "aws_route_table" "eks-public-rt" {
  vpc_id = aws_vpc.k8s-vpc-no-module.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }
  tags = var.tags
}


resource "aws_route_table" "eks-private-rt" {
  vpc_id = aws_vpc.k8s-vpc-no-module.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-nat-gw.id
  }
  tags = var.tags
}
