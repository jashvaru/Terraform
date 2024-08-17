resource "aws_instance" "myec2" {
  ami           = "ami-0a4408457f9a03be3" #ami-0ad21ae1d0696ad58 - ubuntu,  ami-0a4408457f9a03be3 - linux
  instance_type = "t2.micro"

  tags = {
    name = "Hello world"
  }

  lifecycle {
    prevent_destroy = true
  }
}


/*  
Step 1: Create with lifecycle prevent destroy
Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Still creating... [30s elapsed]
aws_instance.myec2: Creation complete after 32s [id=i-021ac503dcdd4f2a9]

Step 2: Destroy
Plan: 0 to add, 0 to change, 1 to destroy.
╷
│ Error: Instance cannot be destroyed
│
│   on dynamic-block.tf line 1:
│    1: resource "aws_instance" "myec2" {
│
│ Resource aws_instance.myec2 has lifecycle.prevent_destroy set, but the plan calls for this resource to be destroyed. To avoid this error and continue
│ with the plan, either disable lifecycle.prevent_destroy or reduce the scope of the plan using the -target option.
╵

*/
