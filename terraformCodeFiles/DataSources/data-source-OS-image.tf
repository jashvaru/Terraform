provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "myOSImage" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.myOSImage.image_id
  instance_type = "t2.micro"
}

