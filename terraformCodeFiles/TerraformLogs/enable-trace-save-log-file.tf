provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
}

/*  
To enable trace in terraform add the env variable as "TF_LOG" : TRACE (TRACE, DEBUG, INFO, WARN, ERROR)
Once you do that you will get logs getting printed while running terraform plan command

To not print the logs in cmd and get the output in the logs file add env variable as "TF_LOG_PATH" : file path to .log
*/