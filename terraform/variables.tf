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

variable "frontend_image" {}
variable "backend_image" {}