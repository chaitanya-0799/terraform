resource "aws_lb" "tf-ALB" {
  name = var.ALB-NAME
  internal = false
  load_balancer_type = var.ALB-TYPE
  security_groups = [ data.aws_security_group.sgs.id ]
  subnets = [ for s in data.aws_subnet.each-subnet : s.id  ]
  ip_address_type = "ipv4"

  enable_deletion_protection = false

  tags = {
    Name = var.ALB-NAME
  }
}