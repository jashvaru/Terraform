variable "my-list" {
  type = list(any)
}

output "mylistValue" {
  value = var.my-list
}

/* 
Defined type for variable as list
When string is passed from CLI it will give below error message
Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: Invalid value for input variable
│
│   on list-data-type.tf line 1:
│    1: variable "my-list" {
│
│ Unsuitable value for var.my-list set using an interactive prompt: list of any single type required.


Success scenario
var.my-list
  Enter a value: ["hi", "bye"]


Changes to Outputs:
  + mylistValue = [
      + "hi",
      + "bye",
    ]

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.
*/
