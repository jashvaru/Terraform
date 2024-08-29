terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

variable "splunk" {
  default = "8088"
}

resource "aws_eip" "example" {
  vpc = true
}

resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }

  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


/*  
moved egress block into proper aws_security_group brackets
*/

/*  
terraform plan -var="splunk=8089"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.example will be created
  + resource "aws_eip" "example" {
      + allocation_id     = (known after apply)
      + association_id    = (known after apply)
      + customer_owned_ip = (known after apply)
      + domain            = (known after apply)
      + id                = (known after apply)
      + instance          = (known after apply)
      + network_interface = (known after apply)
      + private_dns       = (known after apply)
      + private_ip        = (known after apply)
      + public_dns        = (known after apply)
      + public_ip         = (known after apply)
      + public_ipv4_pool  = (known after apply)
      + vpc               = true
    }

  # aws_security_group.security_group_payment_app will be created
  + resource "aws_security_group" "security_group_payment_app" {
      + arn                    = (known after apply)
      + description            = "Application Security Group"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 8089
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8089
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = (known after apply)
              + from_port        = 8443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8443
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "172.31.0.0/16",
                ]
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "172.31.0.0/16",
                ]
              + from_port        = 8080
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 8080
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "payment_app"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + vpc_id                 = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
*/


