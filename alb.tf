# Create Application Load Balancer
resource "aws_lb" "application_load_balancer" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az1.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az2.id
  }

  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

# Create Target Group
resource "aws_lb_target_group" "alb_target_group" {
  name        = var.alb_target_group_name
  target_type = var.alb_target_type
  port        = var.alb_target_port
  protocol    = var.alb_target_protocol
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold   = var.health_check_healthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = {
    Name = var.alb_target_group_name
  }
}

# Create a Listener on Port 80 with Redirect Action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.alb_http_listener_port
  protocol          = var.alb_http_listener_protocol

  default_action {
    type = "redirect"

    redirect {
      host        = var.alb_redirect_host
      path        = var.alb_redirect_path
      port        = var.alb_redirect_port
      protocol    = var.alb_redirect_protocol
      status_code = var.alb_redirect_status_code
    }
  }
}

# Create a Listener on Port 443 with Forward Action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn  = aws_lb.application_load_balancer.arn
  port               = var.alb_https_listener_port
  protocol           = var.alb_https_listener_protocol
  ssl_policy         = "ELBSecurityPolicy-2016-08"
  certificate_arn    = var.alb_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}


// Note that here you have to get an already prepared certificate from the Manager with it's ARN to Move forward // 