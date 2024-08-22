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

variable "ami" {}
variable "instance_type" {}



/*  
Step 1: Added varibles in the module file to increase its flexibility
Step 2: instead of writing provider and its version in the ec2.tf file adding required block (terraform)
in main.tf file
*/
