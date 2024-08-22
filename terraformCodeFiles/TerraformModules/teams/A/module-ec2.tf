module "ec2" {
  source        = "../../modules/ec2"
  region        = "ap-south-1"
  ami           = "ami-1234"
  instance_type = "t2.micro"
}
