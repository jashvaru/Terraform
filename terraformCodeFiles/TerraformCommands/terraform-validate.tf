resource "aws_instance" "myec2" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
  sky           = "temp"
}

/*  
terraform validate
╷
│ Error: Unsupported argument
│
│   on dynamic-block.tf line 4, in resource "aws_instance" "myec2":
│    4:   sky           = "temp"
│
│ An argument named "sky" is not expected here.
╵
*/
