resource "aws_eip" "eks-nat-eip" {
  domain     = "vpc"
  tags       = var.tags
  depends_on = [aws_internet_gateway.eks-igw]

}

resource "aws_nat_gateway" "eks-nat-gw" {
  allocation_id = aws_eip.eks-nat-eip.id
  subnet_id     = aws_subnet.no-module-k8s-subnet[0].id
  depends_on    = [aws_internet_gateway.eks-igw, aws_eip.eks-nat-eip]
  tags          = var.tags
}
