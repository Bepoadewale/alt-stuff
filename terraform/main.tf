provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  vpc_cidr    = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"
  version = "4.0.0"
  cluster_name      = var.ecs_cluster_name
  frontend_image    = var.frontend_image
  backend_image     = var.backend_image
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
}