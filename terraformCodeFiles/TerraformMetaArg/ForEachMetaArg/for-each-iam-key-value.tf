resource "aws_iam_user" "user" {
  for_each = {
    key1 = "value1",
    key2 = "value2"
  }
  name = each.value
}
