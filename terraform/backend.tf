terraform {
  backend "s3" {
    bucket         = "tja-project-s3"
    key            = "project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tja-project-dynamodb-table"
    encrypt        = true
  }
}