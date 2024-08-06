provider "aws" {
  region = var.region
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.task_definition_name
  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = "256"  # Change as needed
  memory                  = "512"  # Change as needed

  container_definitions = jsonencode([
    {
      name      = "my-container"
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = var.desired_count

  launch_type = "FARGATE"

  network_configuration {
    subnets          = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]  # Replace with  subnet IDs
    security_groups  = ["sg-xxxxxxxx"]  # Replace with security group ID
    assign_public_ip = true
  }
}
