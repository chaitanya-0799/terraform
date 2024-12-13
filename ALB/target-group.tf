resource "aws_lb_target_group" "worker-tg" {
  name = var.worker-tg-name
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.k8s.id
  target_type = "instance"
  protocol_version = "HTTP1"
  
  health_check {
    interval            = 30
    path                = var.health_check_path
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "worker-tg-attach" {
  depends_on = [ aws_lb_target_group.worker-tg ]
  target_group_arn = aws_lb_target_group.worker-tg.arn
  target_id = data.aws_instance.worker.id
  port = 80
}

resource "aws_lb_target_group" "node-tg" {
  name = var.node-tg-name
  port = 80
  protocol = "HTTP"
  protocol_version = "HTTP1"
  vpc_id = data.aws_vpc.k8s.id
  target_type = "instance"
  
  health_check {
    interval            = 30
    path                = var.health_check_path
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "node-tg-attach" {
    depends_on = [ aws_lb_target_group.node-tg ]
    target_group_arn = aws_lb_target_group.node-tg.arn
    target_id = data.aws_instance.node.id
    port = 80  
}