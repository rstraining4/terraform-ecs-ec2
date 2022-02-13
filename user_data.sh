#!/bin/bash

# Update all packages

sudo yum update -y
sudo amazon-linux-extras disable docker
sudo amazon-linux-extras install -y ecs
sudo systemctl enable --now ecs
curl -s http://localhost:51678/v1/metadata | python -mjson.tool
#sudo service docker start
#sudo start ecs

#Adding cluster name in ecs config
echo ECS_CLUSTER=ecs-ec2-cluster >> /etc/ecs/ecs.config
cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"