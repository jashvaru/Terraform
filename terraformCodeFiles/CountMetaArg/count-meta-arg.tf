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
