terraform {
  cloud {
    organization = "nekoyatu-test-terraform"
    workspaces {
      name = "learn-tfc-aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-07d9cf938edb0739b"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
