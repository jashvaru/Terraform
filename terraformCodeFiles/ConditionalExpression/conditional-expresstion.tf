variable "env" {
  default = "dev"
}

variable "region" {
  default = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = var.env == "dev" ? "t2.micro" : "m5.large"
}

resource "aws_iam_user" "user" {
  name = var.env == "prod" && var.region == "us-east-1" ? "${var.env}+${var.region}" : "Hi"
}

/*  
Based on the condition it will select value of the intance type
var.env = "dev" then "t2.micro"
vae.env = "prod" then "m5.large"
*/

/*  
Based on the condition it will select value of the intance type
var.env = "dev" && var.region == "us-east-1" then "Hi"
vae.env = "prod" && var.region == "us-east-1" then "prod+us-east-1"
*/
