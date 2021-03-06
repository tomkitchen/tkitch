terraform {
  required_version = "1.0.1"
  backend "remote" {
    organization = "tkitch"

    workspaces {
      prefix = "init-"
    }
  }
}

provider "aws" {
  region  = var.region
}

resource "aws_vpc" "test_vpc" {
  cidr_block = var.environments[var.environment].cidr_block
#  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.environment
    Workspace = terraform.workspace
  }
}
