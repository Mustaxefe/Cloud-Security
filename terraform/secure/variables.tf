variable "aws_region" {
  description = "AWS region for the lab"
  type        = string
  default     = "sa-east-1"
}

variable "project_name" {
  description = "Project name used in resource naming"
  type        = string
  default     = "cloud-security-lab"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "secure"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.10.2.0/24"
}

variable "allowed_ssh_cidr" {
  description = "Authorized public IP in CIDR notation to access SSH"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}