resource "aws_subnet" "no-module-k8s-subnet" {
  count                   = 6
  vpc_id                  = aws_vpc.k8s-vpc-no-module.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index + 1) # 192.168.1.0/24
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags = merge(var.tags, {
    # Logic: Indices 0,1,2,3 (first 4) are public, 4,5 (last 2) are private/
    Name = count.index < 4 ? "Public-subnet-${count.index + 1}" : "Private-Subnet-${count.index - 3}"
    Tier = count.index < 4 ? "Public" : "Private"
  })
}
