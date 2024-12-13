resource "aws_lb_listener" "worker-ls" {
  load_balancer_arn = aws_lb.tf-ALB.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.worker-tg.arn
  }
}

resource "aws_lb_listener_rule" "worker-lr" {
  listener_arn = aws_lb_listener.worker-ls.arn
  priority = 2

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.worker-tg.arn
  }
  condition {
    path_pattern {
      values = [ "/worker" ]
    }
  }
  tags = {
    Name = "worker"
  }
}

resource "aws_lb_listener_rule" "node-lr" {
  listener_arn = aws_lb_listener.worker-ls.arn
  priority = 3

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.node-tg.arn
  }
  condition {
    path_pattern {
      values = [ "/node" ]
    }
  }
  tags = {
    Name = "node"
  }
}