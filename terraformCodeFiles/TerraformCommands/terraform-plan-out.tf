resource "local_file" "foo" {
  content  = "Hello world!"
  filename = "${path.module}/foo.txt"
}


/*  
If I run terraform plan -out infra.plan it will generate a plan file with below details
Terraform will perform the following actions:

  # local_file.foo will be created
  + resource "local_file" "foo" {
      + content              = "Hello world!"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./foo.txt"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: infra.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "infra.plan"

*/

//--------------------------------------------------------------------------------------------------------------------------------

/* 
terraform apply "infra.plan"
local_file.foo: Creating...
local_file.foo: Creation complete after 0s [id=d3486ae9136e7856bc42212385ea797094475802]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
*/
