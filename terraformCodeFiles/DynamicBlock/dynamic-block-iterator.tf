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
    iterator = port //Create a iterator for each port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.portList
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

