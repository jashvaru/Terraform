variable "my-set" {
  type    = set()
  default = toset("a", "b", "b", "c")
}

output "mylistValue" {
  value = var.my-set
}
