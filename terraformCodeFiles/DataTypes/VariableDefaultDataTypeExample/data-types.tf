resource "aws_instance" "myec2" {
  ami           = "a"
  instance_type = var.instance_type1
}

/* 
In this example we are setting data type for the instance as number
When value is entered from CLI as String it will throw error

Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: Invalid value for input variable
│
│   on variable.tf line 1:
│    1: variable "instance_type1" {
│
│ Unsuitable value for var.instance_type1 set using an interactive prompt: a number is required.

*/
