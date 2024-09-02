variable "portList" {
  type        = list(any)
  description = "Lits of ingress ports"
  default     = [8200, 8201, 8202, 8203, 8204]
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "ingress vault"

  dynamic "ingress" {
    for_each = var.portList
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

/*  
Manually updated tags on aws console
*/

/*  
terraform plan -refresh-only
aws_security_group.dynamicsg: Refreshing state... [id=sg-00bcf675af292136a]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have affected this plan:

  # aws_security_group.dynamicsg has changed
  ~ resource "aws_security_group" "dynamicsg" {
        id                     = "sg-00bcf675af292136a"
        name                   = "dynamic-sg"
      ~ tags                   = {
          + "Env" = "Prod"
        }
      ~ tags_all               = {
          + "Env" = "Prod"
        }
        # (8 unchanged attributes hidden)
    }


This is a refresh-only plan, so Terraform will not take any actions to undo these. If you were expecting these changes then you can apply this plan to
record the updated values in the Terraform state without changing any remote objects.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

*/
