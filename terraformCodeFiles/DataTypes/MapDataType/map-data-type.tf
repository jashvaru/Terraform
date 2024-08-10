variable "my-map" {
  type = map(any)
  default = {
    Team    = "PROD"
    Country = "US"
  }
}

output "myMapValue" {
  value = var.my-map
}

/* 
Defined type for variable as map
var.my-map
  Enter a value: {Team = "UAT"}


Changes to Outputs:
  + myMapValue = {
      + Team = "UAT"
    }

Adding Default values
Changes to Outputs:
  + myMapValue = {
      + Country = "US"
      + Team    = "PROD"
    }

*/
