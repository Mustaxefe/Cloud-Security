output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.lab_vpc.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private_subnet.id
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.secure_sg.id
}

output "ec2_public_ip" {
  description = "Public IP of secure EC2"
  value       = aws_instance.secure_ec2.public_ip
}

output "s3_bucket_name" {
  description = "Secure S3 bucket name"
  value       = aws_s3_bucket.secure_bucket.bucket
}

output "iam_role_name" {
  description = "IAM role name"
  value       = aws_iam_role.limited_role.name
}