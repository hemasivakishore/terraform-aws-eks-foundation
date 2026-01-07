resource "aws_route_table_association" "eks-association" {
  count = 6

  # Maps to the 6 subnets: 0-3 are Public, 4-5 are Private 
  subnet_id = aws_subnet.no-module-k8s-subnet[count.index].id

  # If index is < 4, use the "public" route table; otherwise use "private" [cite: 3]
  route_table_id = count.index < 4 ? aws_route_table.eks-rt["public"].id : aws_route_table.eks-rt["private"].id
}
