variable "team" {
  type = map(any)
  default = {
    Team = "security_team"
  }
}

locals {
  common_tags = {
    Team         = "local_security"
    CreationDate = formatdate("DDMMMYYYY", timestamp())
  }
}

resource "aws_security_group" "sg_01" {
  name = "app-firewall"
  tags = local.common_tags
}

resource "aws_security_group" "sg_02" {
  name = "db-firewall"
  tags = local.common_tags
}

/*  
Created same but now using local variables

Note: We can use functions in locals but not in variables
*/
