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
