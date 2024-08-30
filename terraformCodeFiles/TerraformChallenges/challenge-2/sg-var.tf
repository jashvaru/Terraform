variable "httpsPort" {}
variable "apiDevPort" {}
variable "apiProdPort" {}

variable "cidrIp" {
  type    = list(string)
  default = ["172.31.0.0/16"]
}

variable "splunk" {
  default = "8088"
}
