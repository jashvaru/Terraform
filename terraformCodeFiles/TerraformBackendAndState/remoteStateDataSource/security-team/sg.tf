resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${data.terraform_remote_state.vpc.outputs.elasticip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

/*  
>terraform plan
data.terraform_remote_state.vpc: Reading...
data.terraform_remote_state.vpc: Read complete after 1s

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.allow_tls will be created
  + resource "aws_security_group" "allow_tls" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "allow_tls"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_vpc_security_group_ingress_rule.allow_tls_ipv4 will be created
  + resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "13.202.38.184/32"
      + from_port              = 443
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
      + to_port                = 443
    }

Plan: 2 to add, 0 to change, 0 to destroy.
*/