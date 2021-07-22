provider "aws" {
  region = "us-east-1"
}

module "vpc_dev" {
  source            = "../aws_instance"
  key_name          = "class2"
  public_key = "~/.ssh/id_rsa.pub"
  instance_type     = "t3.micro"
  availability_zone = "us-west-1a"
}



