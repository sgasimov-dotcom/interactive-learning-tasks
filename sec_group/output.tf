output "sec_group_id" {
    value = aws_security_group.sec_group.id
}

output "region" {
    value = "us-east-1"
}

output "attached_vpc" {
    value = aws_security_group.sec_group.vpc_id
}
