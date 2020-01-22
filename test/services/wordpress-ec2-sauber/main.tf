provider "aws" {
  region = "eu-west-1"
}
module "wordpress-ec2" {
  source = "../../../modules/services/wordpress-ec2"
  ec2_instance_name = "ts-instance-ec2-06"
  ami_key_pair_name = "TS-aws-3"

}




