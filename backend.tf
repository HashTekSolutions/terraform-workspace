provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "random" {}

resource "random_integer" "ri" {
  min = 100
  max = 999
}

terraform {
  backend "s3" {
    
    bucket  = "terraform-workspace-123" # Replace with your S3 bucket name
    key     = "statefile/terraform.tfstate"
    region  = "ap-south-1"
  }
}
