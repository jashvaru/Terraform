resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = "t2.micro"
}

/* 
The value of the variable is picked from the dev.tfvars file
*/