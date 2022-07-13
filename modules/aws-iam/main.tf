resource "aws_iam_user" "name" {
  path = var.iam_path
  name = var.iam_name

  tags = var.iam_tags
}
