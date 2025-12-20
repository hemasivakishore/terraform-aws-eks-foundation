resource "aws_route_table_association" "k8s-associations" {
  count = 6

  # Links to each of the 6 subnets created in subnets.tf 
  subnet_id = aws_subnet.no-module-k8s-subnet[count.index].id

  # Logic: If index is 0,1,2,3 -> Public RT | If index is 4,5 -> Private RT
  route_table_id = count.index < 4 ? aws_route_table.eks-public-rt.id : aws_route_table.eks-private-rt.id
}
