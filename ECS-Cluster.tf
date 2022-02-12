##########################################################
# AWS ECS-CLUSTER
#########################################################

resource "aws_ecs_cluster" "cluster" {
  name = "ecs-ec2-cluster"
  tags = {
   name = ecs-ec2-cluster
   }
   
  }