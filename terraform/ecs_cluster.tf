resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "frontend" {
  family = "frontend-task"
  container_definitions = jsonencode([
    {
      name  = "frontend"
      image = var.frontend_image
      portMappings = [{
        containerPort = 80
        hostPort      = 80
      }]
    }
  ])
}

resource "aws_ecs_task_definition" "backend" {
  family = "backend-task"
  container_definitions = jsonencode([
    {
      name  = "backend"
      image = var.backend_image
      portMappings = [{
        containerPort = 5000
        hostPort      = 5000
      }]
    }
  ])
}

resource "aws_ecs_service" "frontend" {
  cluster        = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.frontend.arn
  desired_count  = 2
  launch_type    = "FARGATE"
}

resource "aws_ecs_service" "backend" {
  cluster        = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count  = 2
  launch_type    = "FARGATE"
}