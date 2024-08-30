resource "aws_instance" "dynamicEC2" {
  for_each      = var.instance_config
  ami           = each.value.ami
  instance_type = each.value.instance_type
  tags = {
    Name = each.key
  }
}

/*  
Used for each loop to iterate over the instances
*/
