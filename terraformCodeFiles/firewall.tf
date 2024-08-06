provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed by terraform"
}