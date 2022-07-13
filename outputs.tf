output "new_iam_user_arn" {
  value       = module.new_iam_user.iam_arn
  description = "aws-iam role arn generated while creating this object."
}

output "new_iam_terraform_user_name" {
  value       = module.new_iam_user.iam_terraform_user_name
  description = "This user name output needs for user-policy"
}

output "policy_name" {
  value       = module.new_user_policy.policy_name
  description = "New policy name"
}