provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "tfstate-crcjcosio"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-crcjcosio-locks"
    encrypt        = true
  }
}