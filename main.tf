provider "aws" {
  region = var.iam_region
}

terraform {
  backend "s3" {
    profile = "profile"
    bucket  = "bucket"
    key     = "key"
    region  = "region"
  }
}

module "new_iam_user" {
  source = "./modules/aws-iam"

  iam_path = "/"
  iam_name = "new-user"
  iam_tags = {
    Environment = "Test"
    Terraform   = "true"
  }
}

module "new_user_policy" {
  source           = "./modules/aws-iam-policy"
  user_policy_name = "new-user-policy"
  user_name        = module.new_iam_user.iam_terraform_user_name
  role_policy      = "./modules/s3-policy/s3_policy.json"
  depends_on = [
    module.new_iam_user
  ]
}

module "old_group_membership" {
  source                 = "./modules/aws-iam-group-membership"
  group_membership_name  = "old-group-membership"
  group_membership_users = ["${module.new_iam_user.iam_terraform_user_name}"]
  group_membership_group = "FGr-AllUsers"
}

module "old_group_membership2" {
  source                 = "./modules/aws-iam-group-membership"
  group_membership_name  = "old-group-membership"
  group_membership_users = ["${module.new_iam_user.iam_terraform_user_name}"]
  group_membership_group = "FGr-AccessKeyUsers"
}

module "access_key_for_new_user" {
  source = "./modules/aws-iam-access-key"
  access_key_user = "${module.new_iam_user.iam_terraform_user_name}"
  depends_on = [
    module.new_iam_user
  ]
}