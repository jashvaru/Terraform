provider "aws" {
  region = var.region
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-08a0d1e16fc3f61ea"
    "us-west-2"  = "ami-0b20a6f09484773af"
    "ap-south-1" = "ami-0e1d06225679bc1c5"
  }
}

resource "aws_instance" "app-dev" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"
  count         = length(var.tags)

  tags = {
    Name         = element(var.tags, count.index)
    CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}

/*  
->lookup() retrives a single element from the map passed as first argument & key passed as second argument 
so in above it will return "ami-08a0d1e16fc3f61ea"
->length() determines the length of the given list, map, string so in above it will retrun 2
->element() retrives a single element from the map passed as first argument & index passed as second argument 
so in above it will return "firstec2" in first creation and so on
->timestamp() determines current timestamp
->formatdate() converts a timestamp to given time format
*/
