resource "aws_instance" "myec2" {
  ami                    = "a"
  instance_type          = "b"
  vpc_security_group_ids = var.vpc_sec_ids
}

/* 
In this example vpc_security_group_ids only accepts set of vpc security group ids
If we enter number it will throw an error

Planning failed. Terraform encountered an error while generating this plan.

╷
│ Error: Incorrect attribute value type
│
│   on data-types.tf line 4, in resource "aws_instance" "myec2":
│    4:   vpc_security_group_ids = var.vpc_sec_ids
│     ├────────────────
│     │ var.vpc_sec_ids is "a"
│
│ Inappropriate value for attribute "vpc_security_group_ids": set of string required.

*/
