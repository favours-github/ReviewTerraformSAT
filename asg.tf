# Create a Launch Template
resource "aws_launch_template" "webserver_launch_template" {
  name          = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  description   = "Launch template for web servers"

  monitoring {
    enabled = var.instance_monitoring
  }

  vpc_security_group_ids = var.security_group_ids
}

# Create an Auto Scaling Group
resource "aws_autoscaling_group" "auto_scaling_group" {
  vpc_zone_identifier = var.public_subnet_ids
  desired_capacity    = var.asg_desired_capacity
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  name                = var.asg_name
  health_check_type   = var.asg_health_check_type

  launch_template {
    name    = aws_launch_template.webserver_launch_template.name
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.asg_name
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [desired_capacity]
  }
}

# Attach Auto Scaling Group to ALB Target Group
resource "aws_autoscaling_attachment" "asg_alb_target_group_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.id
  lb_target_group_arn    = aws_lb_target_group.alb_target_group.arn
}

# Create an Auto Scaling Group Notification
resource "aws_autoscaling_notification" "webserver_asg_notifications" {
  group_names = [aws_autoscaling_group.auto_scaling_group.id]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.user_updates.arn
}


// Here you need an AMI Already configured in a previous project in order to continue this project effectively //