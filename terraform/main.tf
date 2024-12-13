provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source      = "./vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}

module "ecs" {
  source            = "./ecs"
  cluster_name      = var.ecs_cluster_name
  frontend_image    = var.frontend_image
  backend_image     = var.backend_image
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
}