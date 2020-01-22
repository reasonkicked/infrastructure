provider "aws" {
  region = "eu-west-1"
}
module "wordpress-ec2" {
  source = "../../../modules/services/wordpress-ec2"
  ec2_instance_name = "ts-instance-ec2-05"
  ami_key_pair_name = "ts-aws-3"

}




