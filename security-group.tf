# Create Security Group for the Application Load Balancer (ALB)
resource "aws_security_group" "alb_security_group" {
  name        = var.alb_security_group_name
  description = "Enable HTTP/HTTPS access on port 80/443"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description  = "HTTP access"
    from_port    = 80
    to_port      = 80
    protocol     = "tcp"
    cidr_blocks  = var.http_allowed_cidrs
  }

  ingress {
    description  = "HTTPS access"
    from_port    = 443
    to_port      = 443
    protocol     = "tcp"
    cidr_blocks  = var.https_allowed_cidrs
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb_security_group_name
  }
}

# Create Security Group for the Bastion Host (Jump Box)
resource "aws_security_group" "ssh_security_group" {
  name        = var.ssh_security_group_name
  description = "Enable SSH access on port 22"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description  = "SSH access"
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks  = var.ssh_allowed_cidrs
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ssh_security_group_name
  }
}

# Create Security Group for the Web Server
resource "aws_security_group" "webserver_security_group" {
  name        = var.webserver_security_group_name
  description = "Enable HTTP/HTTPS access on port 80/443 via ALB SG and access on port 22 via SSH SG"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "HTTP access from ALB"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description      = "HTTPS access from ALB"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description      = "SSH access from Bastion Host"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.ssh_security_group.id]
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.webserver_security_group_name
  }
}

# Create Security Group for the Database
resource "aws_security_group" "database_security_group" {
  name        = var.database_security_group_name
  description = "Enable MySQL/Aurora access on port 3306"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "MySQL/Aurora access from Web Server"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.webserver_security_group.id]
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.database_security_group_name
  }
}
