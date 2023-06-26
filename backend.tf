provider "aws" {
  region  = "ap-south-1"
  profile = "tfuser"
}

terraform {
  backend "s3" {
    
    bucket  = "hashtek-terraform-workspace" # Replace with your S3 bucket name
    key     = "statefile/terraform.tfstate"
    region  = "ap-south-1"
  }
}
