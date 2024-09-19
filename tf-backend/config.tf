variable "region" {
  description = "value of region"
  type        = string
  default     = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
  backend "s3"{
    bucket = "kanishksuri-581b"
    key = "backend-tf-state"
    region = "ap-south-1"
    }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
