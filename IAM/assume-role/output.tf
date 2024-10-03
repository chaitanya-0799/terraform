output "user-arn" {
  value = aws_iam_user.user.arn
}

output "user-access-key" {
  value = aws_iam_access_key.key.id
}

output "secret-key" {
  value = aws_iam_access_key.key.secret
  sensitive = true
}

output "role-arn" {
  value = aws_iam_role.assume.arn
}