provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source        = "../../modules/ec2"
  ami           = "ami-1234"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticip" {
  instance = module.ec2.ec2_instance
  domain   = "vpc"
}

/*  
here I am creating a resource of aws_eip and attaching it to the ec2 instance created using the module
To refer the output value of the module we need to use module.module_name.output_name
*/
