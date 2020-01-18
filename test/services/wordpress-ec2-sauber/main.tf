provider "aws" {
  region = "eu-west-1"
}
module "wordpress-ec2" {
  source = "../../../modules/services/wordpress-ec2"

}

