resource "aws_instance" "sahib" {
  ami           = "ami-0dc2d3e4c0f9ebd18"
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "Hello World"
  }
}
