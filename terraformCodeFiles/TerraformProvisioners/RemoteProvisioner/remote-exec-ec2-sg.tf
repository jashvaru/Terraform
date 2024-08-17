#NOT WORKING

/* resource "aws_security_group" "allow_ssh" {
  name        = "terraform-firewall"
  description = "Managed by terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "sg" {
  default = "${aws_security_group.allow_sss.}"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0a4408457f9a03be3"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${sg.}"]
  key_name      = "terraform-key"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl restart nginx"
    ]
  }
}


 */
