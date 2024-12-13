output "vpc-id" {
  value = data.aws_vpc.k8s.id
}

output "sg-id" {
  value = data.aws_security_group.sgs.id
}

output "subnet-id" {
  value = [ for s in data.aws_subnet.each-subnet : s.id ]
}

output "alb-dns" {
  value = aws_lb.tf-ALB.dns_name
}
