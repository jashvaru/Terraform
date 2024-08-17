resource "aws_iam_user" "user" {
  for_each = toset(["user0", "user1", "user2", "user3"])
  name     = each.key
}


/*  Create IAM user using for_each
toset(["user1", "user2", "user3"])
>terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.user["user1"] will be created
  + resource "aws_iam_user" "user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "user1"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.user["user2"] will be created
  + resource "aws_iam_user" "user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "user2"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

  # aws_iam_user.user["user3"] will be created
  + resource "aws_iam_user" "user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "user3"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

*/


/*  If I add a new value in the set unlike in list of destroy all and create, it will create only the newly added value
toset(["user0", "user1", "user2", "user3"])
>terraform plan
aws_iam_user.user["user3"]: Refreshing state... [id=user3]
aws_iam_user.user["user2"]: Refreshing state... [id=user2]
aws_iam_user.user["user1"]: Refreshing state... [id=user1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.user["user0"] will be created
  + resource "aws_iam_user" "user" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "user0"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
*/
