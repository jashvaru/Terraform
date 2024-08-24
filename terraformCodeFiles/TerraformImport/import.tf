provider "aws" {
  region = "ap-south-1"
}

import {
  to = aws_security_group.mysg
  id = "sg-0d7870be6e060675f"
}

/*  
terraform plan -generate-config-out=my-sg.tf
aws_security_group.mysg: Preparing import... [id=sg-0d7870be6e060675f]
aws_security_group.mysg: Refreshing state... [id=sg-0d7870be6e060675f]

Terraform will perform the following actions:

  # aws_security_group.mysg will be imported
  # (config will be generated)
    resource "aws_security_group" "mysg" {
        arn         = "arn:aws:ec2:ap-south-1:692927338162:security-group/sg-0d7870be6e060675f"
        description = "manual"
        egress      = [
            {
                cidr_blocks      = [
                    "0.0.0.0/0",
                ]
                description      = null
                from_port        = 0
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "-1"
                security_groups  = []
                self             = false
                to_port          = 0
            },
        ]
        id          = "sg-0d7870be6e060675f"
        ingress     = [
            {
                cidr_blocks      = [
                    "0.0.0.0/0",
                ]
                description      = "HTTP"
                from_port        = 22
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "tcp"
                security_groups  = []
                self             = false
                to_port          = 22
            },
        ]
        name        = "manually-created-sg"
        name_prefix = null
        owner_id    = "692927338162"
        tags        = {}
        tags_all    = {}
        vpc_id      = "vpc-0e1c9f1fcae7bba6d"
    }

Plan: 1 to import, 0 to add, 0 to change, 0 to destroy.
╷
│ Warning: Config generation is experimental
│
│ Generating configuration during import is currently experimental, and the generated configuration format may change in future versions.
╵

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform has generated configuration and written it to my-sg.tf. Please review the configuration and edit it as necessary before adding it to version
control.

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

D:\Learning\Terraform\executeTerraformCode>
*/

/* 
terraform apply
Plan: 1 to import, 0 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_security_group.mysg: Importing... [id=sg-0d7870be6e060675f]
aws_security_group.mysg: Import complete [id=sg-0d7870be6e060675f]

Apply complete! Resources: 1 imported, 0 added, 0 changed, 0 destroyed.

 */
