resource "aws_iam_user" "iam" {
  name = "myIam"

  provisioner "local-exec" {
    command    = "echo1 Hello World"
    on_failure = continue
  }
}

