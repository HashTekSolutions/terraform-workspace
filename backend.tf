provider "aws" {
  region  = "ap-south-1"
  profile = "sai"
}

terraform {
  backend "s3" {
    profile = "sai"
    bucket  = "manohar-terraform-code-9966" # Replace with your S3 bucket name
    key     = "statefile/terraform.tfstate"
    region  = "ap-south-1"
  }
}
