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
Without dynamic block
resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "ingress vault"

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8201
    to_port     = 8201
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8202
    to_port     = 8202
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

With dynamic block
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
*/
