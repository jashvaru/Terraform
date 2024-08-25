variable "pass" {
  sensitive = true
  default   = "secretPass"
}

resource "local_file" "file" {
  content  = var.pass
  filename = "password.txt"
}

output "op" {
  value = local_file.file.content
  sensitive = true
}


/*  
If we try to reference sensitive info in the ouput block it will give error
terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform planned the following actions, but then encountered a problem:

  # local_file.file will be created
  + resource "local_file" "file" {
      + content              = (sensitive value)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "password.txt"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
╷
│ Error: Output refers to sensitive values
│
│   on demo.tf line 11:
│   11: output "op" {
│
│ To reduce the risk of accidentally exporting sensitive data that was intended to be only internal, Terraform requires that any root module output
│ containing sensitive data be explicitly marked as sensitive, to confirm your intent.
│
│ If you do intend to export this data, annotate the output value as sensitive by adding the following argument:
│     sensitive = true
╵
*/

/*  
Still if you wish to use output block mark output as sensitive
terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.file will be created
  + resource "local_file" "file" {
      + content              = (sensitive value)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "password.txt"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + op = (sensitive value)
*/
