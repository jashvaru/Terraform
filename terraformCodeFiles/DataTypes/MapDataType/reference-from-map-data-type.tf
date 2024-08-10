variable "my-map" {
  type    = map(any)
  default = { Name = "Jash", Surname = "Varu" }
}

output "print" {
  value = var.my-map["Name"]
}

/* 
Printing map variable values
value = var.my-map["Name"]
Changes to Outputs:
  + print = "Jash"


value = var.my-map[Name]
╷
│ Error: Invalid reference
│
│   on reference-from-list-map-data-type.tf line 12, in output "print":
│   12:   value = var.my-map[Name]
│
│ A reference to a resource type must be followed by at least one attribute access, specifying the resource name.
*/

