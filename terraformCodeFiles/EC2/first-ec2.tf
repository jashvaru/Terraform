provider "aws" {
  region     = "ap-south-1"
  access_key = "KEY"
  secret_key = "KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
}
