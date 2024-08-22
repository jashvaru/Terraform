terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}


resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
}

output "ec2_instance" {
  value = aws_instance.myec2.id
}

variable "ami" {}
variable "instance_type" {}


/*  
Now to use the instance id of the ec2 created as part of the module we need to use ouput block of terraform.
This block will help to reference the instance id in the overrding file
*/
