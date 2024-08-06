terraform {
  cloud {
    organization = "mgumieniak"
    hostname = "app.terraform.io"

    workspaces {
      name = "rds_aurora"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}


