provider "aws" {
  region = "eu-west-1"
}
module "wordpress-ec2" {
  source = "../../../modules/services/wordpress-ec2"
 ec2_instance_name = "ts-instance-ec2-02"
 db_remote_state_bucket = "reasonkicked-infrastructure-s4"
  db_remote_state_key = "/test/services/wordpress-ec2-sauber/terraform.tfstate"
}

