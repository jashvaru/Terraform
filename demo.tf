resource "aws instance" "myec2" {
  ami           = "ami-001"
  instance_type = "t2.micro"
}
