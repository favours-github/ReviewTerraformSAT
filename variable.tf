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
