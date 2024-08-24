resource "aws_eip" "myip" {
  domain = "vpc"
}

output "elasticip" {
  value = aws_eip.myip.public_ip
}



/*  
D:\Learning\Terraform\executeTerraformCode\networking-team>terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.myip will be created
  + resource "aws_eip" "myip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = (known after apply)
      + vpc                  = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + elasticip = (known after apply)
aws_eip.myip: Creating...
aws_eip.myip: Creation complete after 0s [id=eipalloc-00cd5be67b2deb456]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

elasticip = "13.202.38.184"

*/
