output "vpc-id" {
  value = aws_vpc.demo-app.id
}

output "subnet-az1-id" {
  value = aws_subnet.az1.id
}

output "subnet-az2-id" {
  value = aws_subnet.az2.id
}

output "subnet-az3-id" {
  value = aws_subnet.az3.id
}

output "sg-id" {
  value = aws_security_group.sg-2TierApp.id
}

output "eip-id" {
  value = aws_eip.eip.id
}