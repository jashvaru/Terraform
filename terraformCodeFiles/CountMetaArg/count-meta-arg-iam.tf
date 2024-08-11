resource "aws_iam_user" "this" {
  name  = "Jash"
  count = 3
}

/*  
we cannot create a IAM user with the same name terraform will create a plan 
but while creating it will thro an error after creating 1 user

Plan: 3 to add, 0 to change, 0 to destroy.
aws_iam_user.this[0]: Creating...
aws_iam_user.this[2]: Creating...
aws_iam_user.this[1]: Creating...
aws_iam_user.this[2]: Creation complete after 1s [id=Jash]
╷
│ Error: creating IAM User (Jash): operation error IAM: CreateUser, https response error StatusCode: 409, RequestID: 88f61d7e-9e37-490c-899d-0eca0eb9255b, EntityAlreadyExists: User with name Jash already exists.
│
│   with aws_iam_user.this[0],
│   on count-meta-arg.tf line 1, in resource "aws_iam_user" "this":
│    1: resource "aws_iam_user" "this" {
│
╵
╷
│ Error: creating IAM User (Jash): operation error IAM: CreateUser, https response error StatusCode: 409, RequestID: a00579c0-3a32-46b9-a870-c28e98865c36, EntityAlreadyExists: User with name Jash already exists.
│
│   with aws_iam_user.this[1],
│   on count-meta-arg.tf line 1, in resource "aws_iam_user" "this":
│    1: resource "aws_iam_user" "this" {
│

*/
