##############################################################
# AWS ECS-SERVICE
##############################################################

resource "aws_ecs_service" "service" {
  cluster                = "${aws_ecs_cluster.ecs-ec2-cluster.id}"                                 # ecs cluster id
  desired_count          = 1                                                         # no of task running
  launch_type            = "EC2"                                                     # Cluster type ECS OR FARGATE
  name                   = "openapi-service"                                         # Name of service
  task_definition        = "${aws_ecs_task_definition.task_definition.arn}"        # Attaching Task to service
  load_balancer {
    container_name       = "openapi-ecs-container"                                  #"container_${var.component}_${var.environment}"
    container_port       = "8080"
    target_group_arn     = "${aws_alb_target_group.ecs-target-group.arn}"         # attaching load_balancer target group to ecs
 }
  network_configuration {
    #security_groups       = var.default_security_group 
    #subnets               = var.default_subnet
    security_groups       = ["sg-03c4e631d072f58ed"] 
    subnets               = ["subnet-0e4a3c689e1b7eb26"]
    assign_public_ip      = "false"
  }
  depends_on              = ["aws_alb_listener.ecsapp"]
}