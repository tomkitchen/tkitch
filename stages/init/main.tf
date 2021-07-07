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
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.environment
  }
}
