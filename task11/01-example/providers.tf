provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_version = "~> 1.1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}