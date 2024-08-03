provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_user" "IAMuser" {
  name = "first_iam_user_tf"
}