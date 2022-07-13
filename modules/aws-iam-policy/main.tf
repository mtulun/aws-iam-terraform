resource "aws_iam_user_policy" "terraform_user_policy" {
    name = var.user_policy_name
    user = var.user_name
    policy = file(var.role_policy)
}