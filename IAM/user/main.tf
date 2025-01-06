resource "aws_iam_user" "user1" {
  name = "User1"
  path = "/system/"
  force_destroy = true
  tags = {
    Name = "User1"
  }
}

resource "aws_iam_access_key" "user1" {
  user = aws_iam_user.user1.name  
}

resource "aws_iam_user_login_profile" "login" {
  user = aws_iam_user.user1.name
  password_reset_required = true
}