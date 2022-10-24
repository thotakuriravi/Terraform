

terraform {
  
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "my-org"
    workspaces {
      tags = ["getting-started"]
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"

}

provider "aws" {

    profile = "default"
    region = "eu-west-1"
    alias = "eu"
}