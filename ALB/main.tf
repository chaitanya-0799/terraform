
# CREATING APPLICATION LOAD BALANCER
resource "aws_lb" "test" {
  name               = var.alb-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.secgrp]
  subnets            = [
    var.subnetID-1, var.subnetID-2, var.subnetID-3    
  ]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

# CREATING TARGET-GROUP

resource "aws_lb_target_group" "TG" {
  name     = "tf-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
  target_group_health {
    dns_failover {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }

    unhealthy_state_routing {
      minimum_healthy_targets_count      = "1"
      minimum_healthy_targets_percentage = "off"
    }
  }
}


resource "aws_lb_target_group_attachment" "test" {
  for_each          = toset(var.instance_ids)
  target_group_arn  = aws_lb_target_group.TG.arn
  target_id         = each.key
  port              = 80
}