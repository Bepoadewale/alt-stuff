# AWS Region
aws_region = "us-east-1"  # Modify based on your region

# AWS Account ID (Replace this with your actual AWS Account ID)
aws_account_id = "654654474502"

# Docker image URIs for frontend and backend
frontend_image = "${aws_account_id}.dkr.ecr.${aws_region}.amazonaws.com/frontend:latest"
backend_image = "${aws_account_id}.dkr.ecr.${aws_region}.amazonaws.com/backend:latest"

# VPC configuration
vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_block = "10.0.1.0/24"

# EC2 Instance Type for ECS instances (e.g., t3.micro, t3.medium)
ecs_instance_type = "t2.micro"

# Key pair for EC2 instances (this should already exist in your AWS account)
key_pair_name = "windows-demo"

# RDS Instance Configuration for relational DB (for storing form data)
db_instance_class = "db.t3.micro"
db_engine = "mysql"
db_name = "formdata"
db_username = "admin"
db_password = "admin"

# Auto Scaling Group configuration
asg_min_size = 1
asg_max_size = 3
asg_desired_capacity = 2

# ECS Cluster Name (you can change it if you want)
ecs_cluster_name = "web-application-cluster"

# ECR repository names
frontend_ecr_repo_name = "frontend-repo"
backend_ecr_repo_name = "backend-repo"
