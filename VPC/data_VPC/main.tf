provider "aws" {
  region = "ap-south-1"
}

        # FETCHING DATA ON VPC
data "aws_vpc" "vpc" {
  tags = {
    Name = "VPC-1"
  }
}

# FETCHING DATA ON ALL SUBNETS IN VPC
data "aws_subnets" "vpc-1" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}
    # INFO ON EACH SUBNET
data "aws_subnet" "pub" {
  for_each = toset(data.aws_subnets.vpc-1.ids)
  id = each.value
}

# FETCHING DATA ON ALL SECURITY_GROUPS IN VPC
data "aws_security_groups" "vpc-sg" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

    # INFO ON EACH SECURITY_GROUP
data "aws_security_group" "individual" {
  for_each = toset(data.aws_security_groups.vpc-sg.ids)
  id = each.value
}


