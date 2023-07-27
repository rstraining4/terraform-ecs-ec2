terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = "AKIAXWQJBPEHJJUFSTCU"
  secret_key = "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"
  region     = var.aws_region
  #if you are running from AWS ec2 linux instance please use bellow credentials section
  #shared_credentials_file = "$HOME/.aws/credentials"
  #profile = "MyAWS"
}
