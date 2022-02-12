##############################################################
# AWS ECS-SERVICE
##############################################################

resource "aws_ecs_service" "service" {
  cluster                = "${aws_ecs_cluster.cluster.id}"                                 # ecs cluster id
  desired_count          = 1                                                         # no of task running
  launch_type            = "EC2"                                                     # Cluster type ECS OR FARGATE
  name                   = "openapi-service"                                         # Name of service
  task_definition        = "${aws_ecs_task_definition.task_definition.arn}"        # Attaching Task to service
  load_balancer {
    container_name       = "openapi-ecs-container"                                  #"container_${var.component}_${var.environment}"
    container_port       = "8080"
    target_group_arn     = "${aws_lb_target_group.ecs-target-group.arn}"         # attaching load_balancer target group to ecs
 }
  network_configuration {
    security_groups       = var.default_security_group 
    subnets               = var.default_subnet  ## Enter the private subnet id
    assign_public_ip      = "false"
  }
  depends_on              = ["aws_lb_listener.lb_listener"]
}