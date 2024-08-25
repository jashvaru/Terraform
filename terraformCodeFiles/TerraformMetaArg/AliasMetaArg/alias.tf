provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "seoul"
  region = "ap-southeast-2"
}

resource "aws_security_group" "my-sg-1" {
  name = "my-sg-1"
}

resource "aws_security_group" "my-sg-2" {
  provider = aws.seoul
  name     = "my-sg-2"
}

/*  
use alias to specify provider for diff region
To use the provider while creating the resource use provider = aws.seoul

terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.my-sg-1 will be created
  + resource "aws_security_group" "my-sg-1" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "my-sg-1"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.my-sg-2 will be created
  + resource "aws_security_group" "my-sg-2" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "my-sg-2"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
aws_security_group.my-sg-1: Creating...
aws_security_group.my-sg-2: Creating...
aws_security_group.my-sg-1: Creation complete after 2s [id=sg-015a5b8c77af5bf77]
aws_security_group.my-sg-2: Creation complete after 3s [id=sg-088ab3aad1a719bec]
*/
