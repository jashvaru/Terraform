resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
}

/* 
The variable values are read from the values added in environment variables
To declare in the environment variables we need to create a new variable in below manner

TF_VAR_ami
TF_VAR_instance_type
*/
