###############################################################
# AWS ECS-ROUTE53
###############################################################
resource "aws_route53_zone" "r53_private_zone" {
  name         = "vpn-devl.us.e10.c01.example.com."
  #private_zone = false
}

resource "aws_route53_record" "dns" {
  zone_id = "${aws_route53_zone.r53_private_zone.zone_id}"
  name    = "openapi-editor-devl"
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = "${aws_alb.ecs-alb.dns_name}"
    zone_id                = "${aws_alb.ecs-alb.zone_id}"
  }
}