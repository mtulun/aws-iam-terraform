resource "aws_iam_group_membership" "group_membership" {
        name = var.group_membership_name
        users = var.group_membership_users
        group = var.group_membership_group
}

resource "aws_iam_group_membership" "old_group_membership2" {
        name = var.group_membership_name
        users = var.group_membership_users
        group = var.group_membership_group
}