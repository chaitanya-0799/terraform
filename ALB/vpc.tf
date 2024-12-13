data "aws_vpc" "k8s" {
  tags = {
    Name = "Kubernetes"
  }
}

data "aws_security_group" "sgs" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.k8s.id]
  }
  tags = {
    Name = "k8s-sg"
  }
}

data "aws_subnets" "k8s-subnet" {
  filter {
    name = "vpc-id"
    values = [ data.aws_vpc.k8s.id ]
  }
}

data "aws_subnet" "each-subnet" {
  for_each = toset(data.aws_subnets.k8s-subnet.ids)
  id       = each.value
}

data "aws_instance" "worker" {
 filter {
    name = "tag:Name"
    values = [ "Worker-1" ]
  }
}

data "aws_instance" "node" {
  filter {
    name = "tag:Name"
    values = [ "Worker-2" ]
  }
}