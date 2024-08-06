variable "region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "my-ecs-service"
}

variable "task_definition_name" {
  description = "The name of the ECS task definition"
  type        = string
  default     = "my-task-definition"
}

variable "container_image" {
  description = "The Docker image to use for the container"
  type        = string
  default     = "nginx:latest"  # Change to your desired image
}

variable "desired_count" {
  description = "The desired number of tasks to run"
  type        = number
  default     = 1
}
