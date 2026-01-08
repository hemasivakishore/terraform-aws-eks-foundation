module "eks-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.5.1"

  name = var.vpc-name
  cidr = var.cidr-block

  azs             = [data.aws_availability_zones.zones.names[0], data.aws_availability_zones.zones.names[1]]
  private_subnets = [cidrsubnet(var.cidr-block, 8, 110), cidrsubnet(var.cidr-block, 8, 120)]
  public_subnets  = [cidrsubnet(var.cidr-block, 8, 100), cidrsubnet(var.cidr-block, 8, 101)]

  create_igw = true

  enable_dns_hostnames = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  create_private_nat_gateway_route = true

  tags = var.tags
}
