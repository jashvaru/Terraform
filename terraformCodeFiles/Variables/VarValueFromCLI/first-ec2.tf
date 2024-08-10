resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
}

/* 
In CLI pass command as
terraform plan -var="ami=a" -var="instance_type=b"
*/
