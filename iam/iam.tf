resource "aws_iam_user" "bob" {
  name = "bob"
tags = var.key_tags
}


resource "aws_iam_group" "sysusers" {
  name = "sysusers"
 
tags = var.key_tags
}

resource "aws_iam_group_membership" "sysusers" {
  name = "sysusers"
  users = [
    aws_iam_user.bob.name,
  ]
  group = aws_iam_group.sysusers.name
tags = var.key_tags
}

variable "key_tags" {
  description = "Common Tags to apply to all resources"
  type        = map
  default = {
    Owner       = "Denis Astahov"
    Project     = "Phoenix"
    CostCenter  = "12345"
    Environment = "development"
  }
}

