resource "aws_vpc" "demo-app" {
  cidr_block = var.cidr-range
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_subnet" "az1" {
  vpc_id = aws_vpc.demo-app.id
  cidr_block = var.cidr-az1
  availability_zone = var.az-2a
  map_public_ip_on_launch = true
  tags = {
    Name = var.az1-name
  }
}

resource "aws_subnet" "pvt-az2a" {
  vpc_id = aws_vpc.demo-app.id
  cidr_block = var.pvt-2a-cidr
  availability_zone = var.az-2a
  tags = {
    Name = var.pvt-2a-name
  }
}

resource "aws_subnet" "pvt-az2b" {
  vpc_id = aws_vpc.demo-app.id
  cidr_block = var.pvt-2b-cidr
  availability_zone = var.az-2b
  tags = {
    Name = var.pvt-2b-name
  }
}

resource "aws_subnet" "pvt-az2c" {
  vpc_id = aws_vpc.demo-app.id
  cidr_block = var.pvt-2c-cidr
  availability_zone = var.az-2c
  tags = {
    Name = var.pvt-2c-name
  }
}

resource "aws_subnet" "az2" {
  vpc_id = aws_vpc.demo-app.id
  cidr_block = var.cidr-az2
  availability_zone = var.az-2b
  map_public_ip_on_launch = true
  tags = {
    Name = var.az2-name
  }
}

resource "aws_subnet" "az3" {
  vpc_id = aws_vpc.demo-app.id
  cidr_block = var.cidr-az3
  availability_zone = var.az-2c
  map_public_ip_on_launch = true
  tags = {
    Name = var.az3-name
  }
}

resource "aws_internet_gateway" "IGW-app" {
  vpc_id = aws_vpc.demo-app.id
  tags = {
    Name = var.IGW-name
  }
}

resource "aws_route_table" "rt-2TierApp" {
  vpc_id = aws_vpc.demo-app.id

  route {
    cidr_block = var.rt-cidr
    gateway_id = aws_internet_gateway.IGW-app.id
  }
  tags = {
    Name = var.rt-name
  }
}

resource "aws_route_table_association" "rt-az1" {
  subnet_id = aws_subnet.az1.id
  route_table_id = aws_route_table.rt-2TierApp.id
}

resource "aws_route_table_association" "rt-az2" {
  subnet_id = aws_subnet.az2.id
  route_table_id = aws_route_table.rt-2TierApp.id
}

resource "aws_route_table_association" "rt-az3" {
  subnet_id = aws_subnet.az3.id
  route_table_id = aws_route_table.rt-2TierApp.id
}

resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "nat-eip"
  }
}

resource "aws_nat_gateway" "demo-NAT" {
  subnet_id = aws_subnet.az1.id
  allocation_id = aws_eip.eip.id
  tags = {
    Name = var.nat-name
  }
}

resource "aws_route_table" "pvt-rt" {
  vpc_id = aws_vpc.demo-app.id
  route {
    cidr_block = var.rt-cidr
    gateway_id = aws_nat_gateway.demo-NAT.id
  }
  tags = {
    Name = var.pvt-rt
  }
}

resource "aws_route_table_association" "pvt-rt-1" {
  subnet_id = aws_subnet.pvt-az2a.id
  route_table_id = aws_route_table.pvt-rt.id
}

resource "aws_route_table_association" "pvt-rt-2" {
  subnet_id = aws_subnet.pvt-az2b.id
  route_table_id = aws_route_table.pvt-rt.id
}

resource "aws_route_table_association" "pvt-rt-3" {
  subnet_id = aws_subnet.pvt-az2c.id
  route_table_id = aws_route_table.pvt-rt.id
}

resource "aws_security_group" "sg-2TierApp" {
  vpc_id = aws_vpc.demo-app.id

  ingress {
    to_port     = 0
    from_port   = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.sg-name
  }
}