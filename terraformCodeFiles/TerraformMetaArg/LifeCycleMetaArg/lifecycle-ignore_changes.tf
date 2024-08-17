resource "aws_instance" "myec2" {
  ami           = "ami-0a4408457f9a03be3"
  instance_type = "t2.micro"

  tags = {
    name = "Hello world"
  }

  lifecycle {
    ignore_changes = [tags] #ignore_changes = all, ignore_changes = [tags, instance_type]
  }
}


/*  
If we add a new tag from aws console than during plan it will show below detail
Trying to match actual state with desired state
>terraform plan
aws_instance.myec2: Refreshing state... [id=i-00fd3c54abe46b3e4]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.myec2 will be updated in-place
  ~ resource "aws_instance" "myec2" {
        id                                   = "i-00fd3c54abe46b3e4"
      ~ tags                                 = {
          - "env"  = "prod" -> null
            "name" = "Hello world"
        }
      ~ tags_all                             = {
          - "env"  = "prod" -> null
            # (1 unchanged element hidden)
        }
        # (38 unchanged attributes hidden)

        # (8 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

*/

/*  
If we want to avoid the change made at the aws console we can use meta argument as show above

terraform plan
aws_instance.myec2: Refreshing state... [id=i-00fd3c54abe46b3e4]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
*/

