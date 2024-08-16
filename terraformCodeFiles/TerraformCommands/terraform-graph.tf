resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_security_group" "example" {
  name        = "attribute-sg"
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "${aws_eip.lb.public_ip}/32"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_instance" "web" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
}

/*  
terraform graph will give you output in the graph language

digraph G {
  rankdir = "RL";
  node [shape = rect, fontname = "sans-serif"];
  "aws_eip.lb" [label="aws_eip.lb"];
  "aws_instance.web" [label="aws_instance.web"];
  "aws_security_group.example" [label="aws_security_group.example"];
  "aws_vpc_security_group_ingress_rule.example" [label="aws_vpc_security_group_ingress_rule.example"];
  "aws_vpc_security_group_ingress_rule.example" -> "aws_eip.lb";
  "aws_vpc_security_group_ingress_rule.example" -> "aws_security_group.example";
}

to convert this in to a diagram you can use online websites like https://dreampuf.github.io/GraphvizOnline

Instead download the graph viz locally and use command 
terraform graph | dot -Tpng >graph.png
To get the ouput in the png format we can also save it in the svg format
Attaching the img as well

executeTerraformCode/graph.png
*/