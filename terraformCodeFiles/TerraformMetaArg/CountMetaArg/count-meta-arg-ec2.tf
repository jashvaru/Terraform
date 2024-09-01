resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  count         = 3
}

/* 
The count argument created three ec2 instances
with same configuration. It accepts a whole number.
count can be used with any resource block 
*/

/*  
terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.myec2[0] will be created
  + resource "aws_instance" "myec2" {
      + ami                                  = "ami-00c39f71452c08778"
      }

  # aws_instance.myec2[1] will be created
  + resource "aws_instance" "myec2" {
      + ami                                  = "ami-00c39f71452c08778"
      }

  # aws_instance.myec2[2] will be created
  + resource "aws_instance" "myec2" {
      + ami                                  = "ami-00c39f71452c08778"
      }

Plan: 3 to add, 0 to change, 0 to destroy.
*/
