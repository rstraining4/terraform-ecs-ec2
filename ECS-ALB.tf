####################################################################
# AWS ECS-ALB
####################################################################

resource "aws_alb" "ecs-alb" {
  #internal            = "${var.internal}"  # internal = true else false
  name                = "ecs-alb"
  #subnets             = [for subnet in aws_subnet.public : Public.id] 
  #security_groups     = [aws_security_group.AWS9.id]
  subnets             = ["subnet-0eae5ff3b78366cc1","subnet-09c273597170a47f7"]
  security_groups     = ["sg-00f4dde0953e450c6"]
}


resource "aws_alb_target_group" "ecs-target-group" {
  name        = "ecs-target-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "${var.default_vpc}"
  target_type = "ip"


#STEP 1 - ECS task Running
  health_check {
    healthy_threshold   = "3"
    interval            = "10"
    port                = "8080"
    path                = var.health_check_path
    protocol            = "HTTP"
    unhealthy_threshold = "3"
  }
}

resource "aws_alb_listener" "ecsapp" {
  load_balancer_arn = aws_alb.ecs-alb.id
  port              = var.app_port
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #enable above 2 if you are using HTTPS listner and change protocal from HTTPS to HTTPS
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ecs-target-group.arn
  }
}