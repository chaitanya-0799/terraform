resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name                               = "${var.project_name}-vpc"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-${count.index+1}"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/internal-elb"              = "1"

  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_name}-igw"
    "kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/internal-elb"              = "1"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project_name}-rt"
     "kubernetes.io/cluster/${var.project_name}" = "shared"
     "kubernetes.io/role/internal-elb"              = "1"
  }
}

resource "aws_route_table_association" "name" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rt.id
}
