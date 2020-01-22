provider "aws" {
  region = "eu-west-1"
}
# Terraform state will be stored in S3

terraform {
  backend "s3" {
    bucket = "reasonkicked-infrastructure-s3"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }

}


}