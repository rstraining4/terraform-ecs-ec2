#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "= 3.76.1"
#    }
#  }
#}
#
#provider "aws" {
#  #access_key = "put-your-access-key"
#  #secret_key = "put-your-secret-key"
#  region     = var.aws_region
#  #if you are running from AWS ec2 linux instance please use bellow credentials section
#  #shared_credentials_file = "$HOME/.aws/credentials"
#  profile = "MyAWS"
#}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}