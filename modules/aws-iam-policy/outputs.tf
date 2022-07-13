output "policy_name" {
    value = aws_iam_user_policy.terraform_user_policy.name
    description = "New policy name"
}