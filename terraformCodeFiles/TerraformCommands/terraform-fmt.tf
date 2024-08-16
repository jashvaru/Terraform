provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
}

/*  
use of terrafor fmt command

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami  = "ami-0ec0e125bb6c6e8ec"   //indentation is not correct
  instance_type = "t2.micro"
}

after terraform fmt command
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
}

*/
