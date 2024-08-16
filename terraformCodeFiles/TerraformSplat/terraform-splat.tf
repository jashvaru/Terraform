resource "aws_iam_user" "myuser" {
  name  = "iamuser.${count.index}"
  count = 3
}

output "myuserop" {
  value = aws_iam_user.myuser[*].arn
}



/*
Outputs:

myuserop = [
  "arn:aws:iam::692927338162:user/iamuser.0",
  "arn:aws:iam::692927338162:user/iamuser.1",
  "arn:aws:iam::692927338162:user/iamuser.2",
]  
*/
