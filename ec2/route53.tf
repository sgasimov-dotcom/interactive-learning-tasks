resource "aws_route53_record" "wordpress" {
  zone_id = "Z01381853IGNTPM9P6DE6"
  name    = "wordpress.sahibgasimov.net"
  type    = "A"
  ttl     = "60"
 records = [aws_instance.web.public_ip]
}
