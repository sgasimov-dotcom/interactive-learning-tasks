resource "aws_key_pair" "class2" {
  key_name   = "class2"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    Name      = "Web"
    CreatedBy = "Engineer"
    Team      = "DevOps"
  }
}