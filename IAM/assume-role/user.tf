resource "aws_iam_user" "user" {
  name = "STS-user"
}



resource "aws_iam_access_key" "key" {
  user = aws_iam_user.user.name
}