resource "aws_instance" "myec2" {
  ami           = "ami-0a4408457f9a03be3" #ami-0ad21ae1d0696ad58 - ubuntu,  ami-0a4408457f9a03be3 - linux
  instance_type = "t2.micro"

  tags = {
    name = "Hello world"
  }

  lifecycle {
    create_before_destroy = true
  }
}

/*  
Step 1: Create
Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Creation complete after 21s [id=i-06e604676ac0a2aa6]

Step 2: Modify  ami now it it will destroy ec2 created in step1 and create in step2 (Not good for Production)
Plan: 1 to add, 0 to change, 1 to destroy.
aws_instance.myec2: Destroying... [id=i-06e604676ac0a2aa6]
aws_instance.myec2: Still destroying... [id=i-06e604676ac0a2aa6, 10s elapsed]
aws_instance.myec2: Still destroying... [id=i-06e604676ac0a2aa6, 20s elapsed]
aws_instance.myec2: Still destroying... [id=i-06e604676ac0a2aa6, 30s elapsed]
aws_instance.myec2: Still destroying... [id=i-06e604676ac0a2aa6, 40s elapsed]
aws_instance.myec2: Destruction complete after 40s
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Still creating... [30s elapsed]
aws_instance.myec2: Creation complete after 31s [id=i-0180f45f6f2da4c51]

Step 3: Use lifecycle Meta arg "create_before_destroy" to first create a new instance and then destroy the existing instance
Plan: 1 to add, 0 to change, 1 to destroy.
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Creation complete after 21s [id=i-0d71c08c6d4c5eb9e]
aws_instance.myec2 (deposed object 1f85ed36): Destroying... [id=i-0180f45f6f2da4c51]
aws_instance.myec2: Still destroying... [id=i-0180f45f6f2da4c51, 10s elapsed]
aws_instance.myec2: Still destroying... [id=i-0180f45f6f2da4c51, 20s elapsed]
aws_instance.myec2: Still destroying... [id=i-0180f45f6f2da4c51, 30s elapsed]
aws_instance.myec2: Destruction complete after 40s
*/
