resource "aws_iam_user" "iam" {
  name = "myIam"

  provisioner "local-exec" {
    command = "Hello World"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Bye World"
  }
}

/*  
terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.iam will be created
  + resource "aws_iam_user" "iam" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "myIam"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
aws_iam_user.iam: Creating...
aws_iam_user.iam: Provisioning with 'local-exec'...
aws_iam_user.iam (local-exec): Executing: ["cmd" "/C" "Hello World"]
aws_iam_user.iam (local-exec): 'Hello' is not recognized as an internal or external command,
aws_iam_user.iam (local-exec): operable program or batch file.
╷
│ Error: local-exec provisioner error
│
│   with aws_iam_user.iam,
│   on demo.tf line 4, in resource "aws_iam_user" "iam":
│    4:   provisioner "local-exec" {
│
│ Error running command 'Hello World': exit status 1. Output: 'Hello' is not recognized as an internal or external command,
│ operable program or batch file.
│
╵

In terraform.tfstate file the resource is marked as tainted
 "instances": [
        {
          "status": "tainted",
          "schema_version": 0,
*/

/*  
when we try to do terraform apply again it will try to destroy and recreate tainted resources

terraform apply
aws_iam_user.iam: Refreshing state... [id=myIam]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_iam_user.iam is tainted, so must be replaced
-/+ resource "aws_iam_user" "iam" {
      ~ arn                  = "arn:aws:iam::692927338162:user/myIam" -> (known after apply)
      ~ id                   = "myIam" -> (known after apply)
        name                 = "myIam"
      - tags                 = {} -> null
      ~ tags_all             = {} -> (known after apply)
      ~ unique_id            = "AIDA2CVNQC2ZKFA2VLQKC" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.
*/
