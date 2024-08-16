resource "aws_iam_user" "myuser" {
  name  = "iamuser.${count.index}"
  count = 3
}

output "iamuser" {
  value = aws_iam_user.myuser[*].name
}

output "arn" {
  value = aws_iam_user.myuser[*].arn
}

/*  
Outputs:

arn = [
  "arn:aws:iam::692927338162:user/iamuser.0",
  "arn:aws:iam::692927338162:user/iamuser.1",
  "arn:aws:iam::692927338162:user/iamuser.2",
]
iamuser = [
  "iamuser.0",
  "iamuser.1",
  "iamuser.2",
]


terraform output iamuser
[
  "iamuser.0",
  "iamuser.1",
  "iamuser.2",
]

terraform output arn
[
  "arn:aws:iam::692927338162:user/iamuser.0",
  "arn:aws:iam::692927338162:user/iamuser.1",
  "arn:aws:iam::692927338162:user/iamuser.2",
]
*/
