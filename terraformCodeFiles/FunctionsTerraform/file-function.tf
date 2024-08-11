resource "aws_iam_user" "this" {
  name = "demo-jash-user"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "demo-user-policy"
  user = aws_iam_user.this.name

  policy = file("./user-policy.json")
}

/*  
There are inbuilt functions in terraform example
We can try out this function in CLI using below command
terraform console
> min(0, 1, 2)
0
> abs(1.5)
1.5
> abs(-1)
1
> ceil(1.45)
2
> floor(1.45)
*/

/*  
Above code uses file function to read the user policy json file(user-policy.json) from the path where file is saved
*/
