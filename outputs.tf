output "region" {
  value = var.region
}

output "key_name" {
  value = aws_key_pair.ilearning-wordpress.key_name
}

output "key_id" {
  value = aws_key_pair.ilearning-wordpress.key_pair_id
}

variable "region" {
    type = string
  default = "us-east-2"
description = "please provide region"
}