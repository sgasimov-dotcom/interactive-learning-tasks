output "sec_group_id" {
    value = aws_security_group.external_by_terraform.id
}

output "region" {
    value = "us-east-1"
}

output "owner_id" {
    value = aws_security_group.external_by_terraform.owner_id
}

output "arn" {

    value = aws_security_group.external_by_terraform.arn
}