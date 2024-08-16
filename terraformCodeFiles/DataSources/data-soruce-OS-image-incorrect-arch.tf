provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "myOSImage" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.myOSImage.image_id
  instance_type = "t2.micro"
}

/*  
If the architecture of the OS is different from the architecture of the instance
type it will throw an error

 Error: creating EC2 Instance: operation error EC2: RunInstances, https response error StatusCode: 400, RequestID: 3e7d9fbc-79c0-4458-b837-cba9b5370320, api error InvalidParameterValue: The architecture 'x86_64,i386' of the specified instance type does not match the architecture 'arm64' of the specified AMI. Specify an instance type and an AMI that have matching architectures, and try again. You can use 'describe-instance-types' or 'describe-images' to discover the architecture of the instance type or AMI.
│
│   with aws_instance.myec2,
│   on data-sources.tf line 15, in resource "aws_instance" "myec2":
│   15: resource "aws_instance" "myec2" {
│
*/ 
