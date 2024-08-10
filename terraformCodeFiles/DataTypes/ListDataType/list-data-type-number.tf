variable "my-list" {
  type = list(number)
}

output "mylistValue" {
  value = var.my-list
}

/* 
Defined type for variable as list(number) the data type passed in round braces is type of that 
list it can have values like (any), (number), (string), etc

var.my-list
  Enter a value: ["hi", 123]


Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: Invalid value for input variable
│
│   on list-data-type.tf line 1:
│    1: variable "my-list" {
│
│ Unsuitable value for var.my-list set using an interactive prompt: a number is required.

*/
