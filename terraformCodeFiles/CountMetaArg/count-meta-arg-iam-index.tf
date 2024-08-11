resource "aws_iam_user" "user" {
  name  = "payments-user-${count.index}"
  count = 3
}

/* 
Cretaed three IAM users
payments-user-0
payments-user-1
payments-user-2
*/
