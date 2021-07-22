variable "instance_type" {
  default = "t2.micro"  
}

variable "key_name" {
  default = "class2"
}

variable "availability_zone" {
  default = "us-east-2b"
}

variable "name" {
  default = "aws"
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
  }
