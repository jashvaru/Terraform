variable "my-list" {
  type    = list(any)
  default = ["Hi", "Bye"]
}

output "print" {
  value = var.my-list[0]
}

/* 
Printing list variable values
value = var.my-list[0]
Changes to Outputs:
  + print = "Hi"

value = var.my-list[1]
Changes to Outputs:
  + print = "Bye"

value = var.my-list[2]
Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: Invalid index
│
│   on reference-from-list-map-data-type.tf line 12, in output "print":
│   12:   value = var.my-list[2]
│     ├────────────────
│     │ var.my-list is list of string with 2 elements
│
│ The given key does not identify an element in this collection value: the given index is greater than or equal to the
│ length of the collection.
*/
