variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "my-vpc"
}

variable "internet_gateway_name" {
  description = "Name of the Internet Gateway"
  default     = "my-igw"
}

variable "az1" {
  description = "First availability zone"
  default     = "us-east-1a"
}

variable "az2" {
  description = "Second availability zone"
  default     = "us-east-1b"
}

variable "public_subnet_az1_cidr" {
  description = "CIDR block for public subnet in AZ1"
  default     = "10.0.1.0/24"
}

variable "public_subnet_az1_name" {
  description = "Name of the public subnet in AZ1"
  default     = "public-subnet-az1"
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for public subnet in AZ2"
  default     = "10.0.2.0/24"
}

variable "public_subnet_az2_name" {
  description = "Name of the public subnet in AZ2"
  default     = "public-subnet-az2"
}

variable "public_route_table_name" {
  description = "Name of the public route table"
  default     = "public-route-table"
}

variable "private_app_subnet_az1_cidr" {
  description = "CIDR block for private app subnet in AZ1"
  default     = "10.0.3.0/24"
}

variable "private_app_subnet_az1_name" {
  description = "Name of the private app subnet in AZ1"
  default     = "private-app-subnet-az1"
}

variable "private_app_subnet_az2_cidr" {
  description = "CIDR block for private app subnet in AZ2"
  default     = "10.0.4.0/24"
}

variable "private_app_subnet_az2_name" {
  description = "Name of the private app subnet in AZ2"
  default     = "private-app-subnet-az2"
}

variable "private_data_subnet_az1_cidr" {
  description = "CIDR block for private data subnet in AZ1"
  default     = "10.0.5.0/24"
}

variable "private_data_subnet_az1_name" {
  description = "Name of the private data subnet in AZ1"
  default     = "private-data-subnet-az1"
}

variable "private_data_subnet_az2_cidr" {
  description = "CIDR block for private data subnet in AZ2"
  default     = "10.0.6.0/24"
}

variable "private_data_subnet_az2_name" {
  description = "Name of the private data subnet in AZ2"
  default     = "private-data-subnet-az2"
}


// Nat-Gateway Variable file //

# Elastic IP Names
variable "eip_nat_gateway_az1_name" {
  description = "Name of the Elastic IP for NAT Gateway in AZ1"
  default     = "eip-nat-gateway-az1"
}

variable "eip_nat_gateway_az2_name" {
  description = "Name of the Elastic IP for NAT Gateway in AZ2"
  default     = "eip-nat-gateway-az2"
}

# NAT Gateway Names
variable "nat_gateway_az1_name" {
  description = "Name of the NAT Gateway in AZ1"
  default     = "nat-gateway-az1"
}

variable "nat_gateway_az2_name" {
  description = "Name of the NAT Gateway in AZ2"
  default     = "nat-gateway-az2"
}

# Private Route Table Names
variable "private_route_table_az1_name" {
  description = "Name of the Private Route Table in AZ1"
  default     = "private-route-table-az1"
}

variable "private_route_table_az2_name" {
  description = "Name of the Private Route Table in AZ2"
  default     = "private-route-table-az2"
}


// Security-Group Variable file //

# Security Group Names
variable "alb_security_group_name" {
  description = "Name of the Application Load Balancer security group"
  default     = "alb-security-group"
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group"
  default     = "ssh-security-group"
}

variable "webserver_security_group_name" {
  description = "Name of the web server security group"
  default     = "webserver-security-group"
}

variable "database_security_group_name" {
  description = "Name of the database security group"
  default     = "database-security-group"
}

# Allowed CIDR Blocks
variable "http_allowed_cidrs" {
  description = "CIDR blocks allowed for HTTP access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_allowed_cidrs" {
  description = "CIDR blocks allowed for HTTPS access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ssh_allowed_cidrs" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Change this to a specific IP range for better security
}


// Database-rds Variable file //

# Database Subnet Group Name
variable "database_subnet_group_name" {
  description = "Name of the database subnet group"
  default     = "database-subnet-group"
}

# Database Snapshot Variables
variable "db_snapshot_identifier" {
  description = "Identifier of the latest database snapshot"
  default     = ""
}

variable "most_recent_snapshot" {
  description = "Whether to use the most recent snapshot"
  type        = bool
  default     = true
}

variable "snapshot_type" {
  description = "Type of database snapshot to use"
  default     = "automated"
}

# Database Instance Variables
variable "db_instance_class" {
  description = "Instance class for the database"
  default     = "db.t3.medium"
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot before database deletion"
  type        = bool
  default     = true
}

variable "db_availability_zone" {
  description = "Availability zone for the database instance"
  default     = "us-east-1a"
}

variable "db_identifier" {
  description = "Identifier for the database instance"
  default     = "my-db-instance"
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment for the database"
  type        = bool
  default     = false
}


// ALB Variable file //

# Application Load Balancer Variables
variable "alb_name" {
  description = "Name of the application load balancer"
  default     = "my-application-load-balancer"
}

variable "alb_internal" {
  description = "Whether the ALB is internal"
  type        = bool
  default     = false
}

# Target Group Variables
variable "alb_target_group_name" {
  description = "Name of the ALB target group"
  default     = "alb-target-group"
}

variable "alb_target_type" {
  description = "Target type for the ALB target group"
  default     = "instance"
}

variable "alb_target_port" {
  description = "Port for the ALB target group"
  default     = 80
}

variable "alb_target_protocol" {
  description = "Protocol for the ALB target group"
  default     = "HTTP"
}

# Health Check Variables
variable "health_check_healthy_threshold" {
  description = "Healthy threshold for ALB target group"
  default     = 3
}

variable "health_check_interval" {
  description = "Interval between health checks"
  default     = 30
}

variable "health_check_matcher" {
  description = "HTTP status code matcher for health checks"
  default     = "200"
}

variable "health_check_path" {
  description = "Path for ALB health check"
  default     = "/"
}

variable "health_check_port" {
  description = "Port for health check"
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "Protocol for health check"
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "Timeout duration for health checks"
  default     = 5
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold for ALB target group"
  default     = 3
}

# HTTP Listener Variables
variable "alb_http_listener_port" {
  description = "Port for HTTP listener"
  default     = 80
}

variable "alb_http_listener_protocol" {
  description = "Protocol for HTTP listener"
  default     = "HTTP"
}

# Redirect Action Variables
variable "alb_redirect_host" {
  description = "Redirect host for ALB HTTP listener"
  default     = "#{host}"
}

variable "alb_redirect_path" {
  description = "Redirect path for ALB HTTP listener"
  default     = "/#{path}"
}

variable "alb_redirect_port" {
  description = "Redirect port for ALB HTTP listener"
  default     = "443"
}

variable "alb_redirect_protocol" {
  description = "Redirect protocol for ALB HTTP listener"
  default     = "HTTPS"
}

variable "alb_redirect_status_code" {
  description = "Redirect status code for ALB HTTP listener"
  default     = "HTTP_301"
}

# HTTPS Listener Variables
variable "alb_https_listener_port" {
  description = "Port for HTTPS listener"
  default     = 443
}

variable "alb_https_listener_protocol" {
  description = "Protocol for HTTPS listener"
  default     = "HTTPS"
}

variable "alb_certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS listener"
  default     = ""
}


// SNS Variable file //

# SNS Topic Variables
variable "sns_topic_name" {
  description = "Name of the SNS topic"
  default     = "user-updates-topic"
}

# SNS Subscription Variables
variable "sns_subscription_protocol" {
  description = "Protocol for the SNS topic subscription (e.g., email, SMS, lambda, etc.)"
  default     = "email"
}

variable "sns_subscription_endpoint" {
  description = "Endpoint to receive SNS notifications (e.g., email address or webhook URL)"
  default     = ""
}


// ASG Variable file //

# Launch Template Variables
variable "launch_template_name" {
  description = "Name of the EC2 launch template"
  default     = "webserver-launch-template"
}

variable "ami_id" {
  description = "AMI ID for the web server"
  default     = "ami-1234567890abcdef0"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Key pair name for SSH access"
  default     = ""
}

variable "instance_monitoring" {
  description = "Enable detailed monitoring for instances"
  default     = false
}

variable "security_group_ids" {
  description = "List of security group IDs for the web servers"
  type        = list(string)
  default     = []
}

# Auto Scaling Group Variables
variable "public_subnet_ids" {
  description = "List of public subnet IDs where instances will launch"
  type        = list(string)
  default     = []
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the ASG"
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum number of instances in the ASG"
  default     = 4
}

variable "asg_min_size" {
  description = "Minimum number of instances in the ASG"
  default     = 1
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  default     = "webserver-asg"
}

variable "asg_health_check_type" {
  description = "Health check type for the ASG"
  default     = "EC2"
}
