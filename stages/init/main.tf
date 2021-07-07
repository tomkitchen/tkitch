terraform {
  required_version = "1.0.1"
  backend "remote" {
    organization = "tkitch"

    workspaces {
      prefix = "app-"
    }
  }
}

provider "aws" {
  region  = var.region
}

resource "aws_vpc" "test_vpc" {
  cidr_block = var.environments[environment].cidr_block
  tags = {
    Name = var.environment
  }
}
