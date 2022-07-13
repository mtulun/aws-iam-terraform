output "iam_arn" {
    value = aws_iam_user.name.arn
    description = "aws-iam role arn generated while creating this object."
}

output "iam_terraform_user_name" {
    value = aws_iam_user.name.name
    description = "aws-iam user name output."
}