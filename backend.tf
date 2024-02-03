provider "aws" {
  region  = "ap-south-1"
  profile = "tfuser"
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
