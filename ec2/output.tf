output "AZ" {
  value = aws_instance.web.availability_zone
}

output "record_ip" {
    value = aws_route53_record.wordpress.records
}

output "instance_id" {
 value = aws_instance.web.id
} 

output "region" {
  value = "us-east-1"
}

output "public_ip" {
value = aws_instance.web.public_ip
}

