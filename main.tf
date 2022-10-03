resource "aws_iam_user" "prod_users" {
  name     = each.value
  for_each = var.username
}
resource "aws_iam_user_login_profile" "users" {
  user     = each.value
  for_each = var.username
  password_reset_required = true
  depends_on = [
    aws_iam_user.prod_users
  ]
}
