###########################################################
# AWS ECS-EC2
###########################################################
resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  subnet_id              = var.default_subnet
  instance_type          = "t2.medium"
  iam_instance_profile   = "ecs-instance-profile" 
  vpc_security_group_ids = ["sg-00f4dde0953e450c6"]
  key_name               = "aws"
  ebs_optimized          = "false"
  source_dest_check      = "false"
  associate_public_ip_address = "true"
  #user_data              = "${data.template_file.user_data.rendered}"
  user_data              = "${file("user_data.sh")}"
  /*root_block_device = {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }
  */

lifecycle {
    ignore_changes         = ["ami", "user_data", "subnet_id", "key_name", "ebs_optimized", "private_ip"]
  }

tags = {
    Name = "ecs-instance"
  }
}

//data "template_file" "user_data" {
//  template = "${file("${path.module}/user_data.tpl")}"
//}