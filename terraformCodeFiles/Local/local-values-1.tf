resource "aws_security_group" "sg_01" {
  name = "app-firewall"
  tags = {
    Team = "security_team"
  }
}

resource "aws_security_group" "sg_02" {
  name = "db-firewall"
  tags = {
    Team = "security_team"
  }
}

/*  
Creating SG that have repeated values
*/
