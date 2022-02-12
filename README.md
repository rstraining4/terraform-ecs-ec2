# terraform-ecs-ec2

CI Pipleline :

CD Pipeline: 
Docs to be followed: 
https://medium.com/@awsyadav/automating-ecs-ec2-type-deployments-with-terraform-569863c60e69

Code refered from : https://gist.github.com/awsyadav

========================================================================================================
Difference between task access role and task execution role:
ECS task execution role is capabilities of ECS agent (and container instance), e.g:

Pulling a container image from Amazon ECR
Using the awslogs log driver
ECS task role is specific capabilities within the task itself, e.g:

When your actual code runs

