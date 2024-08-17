variable "username" {
  type    = list(any)
  default = ["jash", "jay", "mohan"]
}
resource "aws_iam_user" "user" {
  name  = var.username[count.index]
  count = 3
}

/*  
We can use count.index to iterate over the list variable as shown above.
It will create iam users

jash var.username[0]
jay  var.username[1]
mohan var.username[2]
*/

