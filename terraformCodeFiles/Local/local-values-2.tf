variable "team" {
  type = map(any)
  default = {
    Team         = "security_team"
    CreationDate = formateDate("DDMMMYYY", timestamp())
  }
}

resource "aws_security_group" "sg_01" {
  name = "app-firewall"
  tags = var.team
}

resource "aws_security_group" "sg_02" {
  name = "db-firewall"
  tags = var.team
}

/*  
Added repeated values as part of the variable

Note: Function are not allowed in the variable

│ Error: Function calls not allowed
│
│   on local-values.tf line 5, in variable "team":
│    5:     CreationDate = formateDate("DDMMMYYY", timestamp())
│
│ Functions may not be called here.
*/
