resource "aws_vpc" "tf-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "tf-vpc"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = var.subnet-1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-${data.aws_availability_zones.available.names[0]}"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = var.subnet-2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-${data.aws_availability_zones.available.names[1]}"
  }
}

resource "aws_subnet" "subnet-3" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = var.subnet-3_cidr
  availability_zone = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-${data.aws_availability_zones.available.names[2]}"
  }
}

resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
    Name = "tf-igw"
  }  
}

resource "aws_route_table" "tf-public-route" {
  vpc_id = aws_vpc.tf-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }
}

resource "aws_route_table_association" "rt-subnet-1" {
  subnet_id = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.tf-public-route.id 
}

resource "aws_route_table_association" "rt-subnet-2" {
  subnet_id = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.tf-public-route.id 
}

resource "aws_route_table_association" "rt-subnet-3" {
  subnet_id = aws_subnet.subnet-3.id
  route_table_id = aws_route_table.tf-public-route.id 
}

resource "aws_security_group" "tf-sg" {
  vpc_id = aws_vpc.tf-vpc.id
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    
  }

  tags = {
    Name = "tf-sg"
  }
}