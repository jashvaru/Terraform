resource "aws_iam_user" "iam" {
  name = "myIam"

  provisioner "local-exec" {
    command = "echo Hello World"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Bye World"
  }
}


/*  
aws_iam_user.iam: Creating...
aws_iam_user.iam: Provisioning with 'local-exec'...
aws_iam_user.iam (local-exec): Executing: ["cmd" "/C" "echo Hello World"]
aws_iam_user.iam (local-exec): Hello World
aws_iam_user.iam: Creation complete after 1s [id=myIam]
*/

/*  
terraform destroy -auto-approve
aws_iam_user.iam: Refreshing state... [id=myIam]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_iam_user.iam will be destroyed
  - resource "aws_iam_user" "iam" {
      - arn                  = "arn:aws:iam::692927338162:user/myIam" -> null
      - force_destroy        = false -> null
      - id                   = "myIam" -> null
      - name                 = "myIam" -> null
      - path                 = "/" -> null
      - tags                 = {} -> null
      - tags_all             = {} -> null
      - unique_id            = "AIDA2CVNQC2ZD7DTXQMYU" -> null
        # (1 unchanged attribute hidden)
    }

Plan: 0 to add, 0 to change, 1 to destroy.
aws_iam_user.iam: Destroying... [id=myIam]
aws_iam_user.iam: Provisioning with 'local-exec'...
aws_iam_user.iam (local-exec): Executing: ["cmd" "/C" "echo Bye World"]
aws_iam_user.iam (local-exec): Bye World
aws_iam_user.iam: Destruction complete after 1s
*/
