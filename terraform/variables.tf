variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ecs_cluster_name" {
  default = "my-app-cluster"
}

variable "aws_account_id" { description = "AWS Account ID"; type = string }
variable "region" { description = "AWS Region"; type = string }
variable "frontend_image" { description = "Frontend Docker image URL"; type = string }
variable "backend_image" { description = "Backend Docker image URL"; type = string }
variable "backend_ecr_repo_name" { description = "ECR repo name for backend"; type = string }
variable "asg_desired_capacity" { description = "Desired capacity for auto scaling group"; type = number }
