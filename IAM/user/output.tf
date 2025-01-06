output "access-key" {
  value = aws_iam_access_key.user1.id
}

output "secret-key" {
  value = aws_iam_access_key.user1.secret
  sensitive = true
  
}


output "user-id" {
  value = aws_iam_user.user1.id
}

output "password" {
  value = aws_iam_user_login_profile.login.password
  sensitive = true
}