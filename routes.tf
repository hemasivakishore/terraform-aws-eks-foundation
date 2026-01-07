locals {
  rt_configs = {
    public  = { gateway_id = aws_internet_gateway.eks-igw.id, name = "eks-public-rt" }
    private = { gateway_id = aws_nat_gateway.eks-nat-gw.id, name = "eks-private-rt" }
  }
}

resource "aws_route_table" "eks-rt" {
  for_each = local.rt_configs
  vpc_id   = aws_vpc.k8s-vpc-no-module.id

  route {
    cidr_block = "0.0.0.0/0"
    # Dynamically select between IGW and NAT GW
    gateway_id     = each.key == "public" ? each.value.gateway_id : null
    nat_gateway_id = each.key == "private" ? each.value.gateway_id : null
  }

  tags = merge(var.tags, { Name = each.value.name })
}
