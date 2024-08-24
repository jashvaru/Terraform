terraform {
  backend "s3" {
    bucket = "jash-s3-bucket"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}

/*  
Create a new S3 bucket in aws
This bucket will store .tfstate file in S3 and S3 will act as a centralized backend

The above code is to configure s3 as terraform backend
Credentials to connect to s3 is configured using aws CLI
aws configure
AWS Access Key ID [****************MFLW]:
AWS Secret Access Key [****************hAGg]:
Default region name [ap-south-1]:
Default output format [json]:

connect to s3 from cli 
aws s3 ls s3://jash-s3-bucket
 PRE network/
*/
