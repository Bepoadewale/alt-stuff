terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket111"
    key            = "ecs-deployment/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "terraform-locks"
  }
}