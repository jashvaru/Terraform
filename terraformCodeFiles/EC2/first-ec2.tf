provider "aws" {
  region     = "ap-south-1"
  access_key = "KEY"
  secret_key = "KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
}

/*  
There are diff ways to provide credentials
1. Hardcoding it inside the code as shown above
2. Creating environment variables with name as AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION
3. Saving the credentials inside config and credentials.
  provider "aws" {
    shared_config_files      = ["path_to_config"]
    shared_credentials_files = ["path_to_credentials"]
}
4. Using AWS CLI configuration. Download and install aws-cli
  aws configure
  AWS Access Key ID [****************MFLW]:
  AWS Secret Access Key [****************hAGg]:
  Default region name [ap-south-1]:
  Default output format [json]:

*/
