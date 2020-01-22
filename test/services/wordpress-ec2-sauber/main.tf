provider "aws" {
  region = "eu-west-1"
}
module "wordpress-ec2" {
  source = "../../../modules/services/wordpress-ec2"
 ec2_instance_name = "ts-instance-ec2-03"

  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "reasonkicked-infrastructure-s3"
    key            = "test/services/wordpress-ec2-sauber/terraform.tfstate"
    region         = "eu-west-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
}

