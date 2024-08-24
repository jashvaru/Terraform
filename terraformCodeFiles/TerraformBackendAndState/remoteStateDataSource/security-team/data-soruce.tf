data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
      bucket = "jash-nw-bucket"
      key = "network/eip.tf"
      region = "ap-south-1"
    }
}

/*  
security-team>terraform plan
data.terraform_remote_state.vpc: Reading...
data.terraform_remote_state.vpc: Read complete after 0s
*/