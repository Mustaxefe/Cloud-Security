provider "aws" {
    region = "sa-east-1"
}

resource "aws_vpc" "lab_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "cloud-security-lab"
    }

}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.lab_vpc.id 
    cidr_block = "10.0.1.0/24"

    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.lab_vpc.id
    cidr_block = "10.0.2.0/24"

    tags = {
        Name = "private-subnet"
    }
}

resource "aws_security_group" "insecure_sg" {
    name = "insecure-sg"
    vpc_id = aws__vpc.lab_vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "insecure_ec2"{
    
    ami = "ami-06a73f9d93a3879b5" # Amazon Linux 2
    instance_type = "t3.micro"

    subnet_id = aws_subnet.public_subnet.id
    
    vpc_security_group_ids = [
        aws_security_group.insecure_sg.id
    ]

    tags = {
        Name = "insecure-server"
    }
}

resource "aws_s3_bucket" "insecure_bucket"{
    bucket = "cloud-security-lab-insecure-bucket"
}

resource "aws_s3_bucket_public_access_block" "allow_public" {
    bucket = aws_s3_bucket.insecure_bucket.id

    block_public_acls = false
    block_public_policy = false 
}

resource "aws_iam_role" "amin_role" {

    name = "cloud-security-lab-admin"

    assume_role_ppolicy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = "sts::AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        }]
    })
}

resource "aws_iam_role_policy_attachment" "admin_policy" {

    role = aws_iam_role.admin_role.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}