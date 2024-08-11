variable "username" {
  type    = list(any)
  default = ["jash", "jay"]
}
resource "aws_iam_user" "user" {
  name  = var.username[count.index]
  count = 3
}

/*  
We can use count.index to iterate over the list variable as shown above.
It will create iam users. If count is more than actual value of list it will throw an error.

jash var.username[0]
jay  var.username[1]

╷
│ Error: Invalid index
│
│   on count-meta-arg.tf line 6, in resource "aws_iam_user" "user":
│    6:   name  = var.username[count.index]
│     ├────────────────
│     │ count.index is 2
│     │ var.username is list of string with 2 elements
│
│ The given key does not identify an element in this collection value: the given index is greater than or equal to the length of the collection.
*/

