variable "aws_region" {
  default     = "ap-south-1"
  description = "aws region where our resources going to create choose"
  #replace the region as suits for your requirement
}

variable "az_count" {
  default     = "2"
  description = "number of availability zones in above region"
}

variable "ecs_task_execution_role" {
  default     = "myECcsTaskExecutionRole"
  description = "ECS task execution role name"
}

variable "app_image" {
  default     = "nginx:latest"
  description = "docker image to run in this ECS cluster"
}

variable "app_port" {
  default     = "80"
  description = "portexposed on the docker image"
}

variable "app_count" {
  default     = "2" #choose 2 bcz i have choosen 2 AZ
  description = "numer of docker containers to run"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  default     = "1024"
  description = "fargate instacne CPU units to provision,my requirent 1 vcpu so gave 1024"
}

variable "fargate_memory" {
  default     = "2048"
  description = "Fargate instance memory to provision (in MiB) not MB"
}

variable "default_vpc" {
  default     = "VPC1"
  description = "Default VPC if VPC is not being created"
}

variable "default_subnet" {
  default     = "Public"
  description = "Default VPC if VPC is not being created"
}

variable "ami" {
  default     = "ami-0c6615d1e95c98aca"
  description = "Default Amazon Linux AMI"
}

variable "default_security_group" {
  default     = "AWS9"
  description = "Default VPC if VPC is not being created"
}
