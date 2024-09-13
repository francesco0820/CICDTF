terraform {
  backend "s3" {
    bucket = "terraformbackendlab"
    key="state"
    region = "us-east-1"
    dynamodb_table = "backend"   
  }
}