resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed by terraform"
}


resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.ipaddress
  from_port         = var.port
  ip_protocol       = "tcp"
  to_port           = var.port
}