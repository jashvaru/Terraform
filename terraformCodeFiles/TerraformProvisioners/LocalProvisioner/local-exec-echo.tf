resource "aws_instance" "myec2" {
  ami           = "ami-0a4408457f9a03be3"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo Hello world"
  }
}


/*  

Plan: 1 to add, 0 to change, 0 to destroy.
aws_instance.myec2: Creating...
aws_instance.myec2: Still creating... [10s elapsed]
aws_instance.myec2: Still creating... [20s elapsed]
aws_instance.myec2: Still creating... [30s elapsed]
aws_instance.myec2: Provisioning with 'local-exec'...
aws_instance.myec2 (local-exec): Executing: ["cmd" "/C" "echo Hello world"]
aws_instance.myec2 (local-exec): Hello world
aws_instance.myec2: Creation complete after 31s [id=i-0ff48cd56ca969483]
*/
