resource "local_file" "foo" {
  content  = "Hello world!"
  filename = "${path.module}/foo.txt"
}

/*  
terraform plan -out infra.plan
terraform apply infra.plan

local_file.foo: Creating...
local_file.foo: Creation complete after 0s [id=d3486ae9136e7856bc42212385ea797094475802]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
*/

