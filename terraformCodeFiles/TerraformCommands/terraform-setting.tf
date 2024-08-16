terraform {
  required_version = "1.9.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

resource "aws_iam_user" "myuser" {
  name  = "iamuser.${count.index}"
  count = 3
}


/* 
terraform version show the current version
Terraform v1.9.2
on windows_amd64
+ provider registry.terraform.io/hashicorp/aws v5.62.0
+ provider registry.terraform.io/hashicorp/local v2.5.1

Your version of Terraform is out of date! The latest version
is 1.9.3. You can update by downloading from https://www.terraform.io/downloads.html 
*/

/*  
terraform plan
╷
│ Error: Unsupported Terraform Core version
│
│   on dynamic-block.tf line 2, in terraform:
│    2:   required_version = "1.8"
│
│ This configuration does not support Terraform version 1.9.2. To proceed, either choose another supported Terraform version or update this version
│ constraint. Version constraints are normally set for good reason, so updating the constraint may lead to other errors or unexpected behavior.
*/

/*  
terraform plan
╷
│ Error: Inconsistent dependency lock file
│
│ The following dependency selections recorded in the lock file are inconsistent with the current configuration:
│   - provider registry.terraform.io/hashicorp/aws: locked version selection 5.62.0 doesn't match the updated version constraints "5.61.0"
│
│ To update the locked dependency selections to match a changed configuration, run:
│   terraform init -upgrade

terraform init -upgrade    upgrate to the version mentioned in terraform settings block
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "5.61.0"...
- Installing hashicorp/aws v5.61.0...
- Installed hashicorp/aws v5.61.0 (signed by HashiCorp)
Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
*/

