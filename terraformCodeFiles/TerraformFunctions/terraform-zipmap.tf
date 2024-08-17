resource "aws_iam_user" "myuser" {
  name  = "iamuser.${count.index}"
  count = 3
}

output "myuserop" {
  value = aws_iam_user.myuser[*].arn
}

output "name" {
  value = aws_iam_user.myuser[*].name
}

output "combined" {
  value = zipmap(aws_iam_user.myuser[*].name, aws_iam_user.myuser[*].arn)
}

/* 
zipmap(list of keys, list of values)
Changes to Outputs:
  + combined = {
      + "iamuser.0" = "arn:aws:iam::692927338162:user/iamuser.0"
      + "iamuser.1" = "arn:aws:iam::692927338162:user/iamuser.1"
      + "iamuser.2" = "arn:aws:iam::692927338162:user/iamuser.2"
    }

*/
