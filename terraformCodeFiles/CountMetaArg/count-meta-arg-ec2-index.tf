resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  count         = 3
  tags = {
    name = "payments-system-${count.index}"
  }
}

/*  
Each block is created with the index associated with it
So we can use count.index to read that index value


  # aws_instance.myec2[0] will be created
  + resource "aws_instance" "myec2" {
      + ami                                  = "ami-00c39f71452c08778"
      + tags                                 = {
          + "name" = "payments-system-0"
        }
      + tags_all                             = {
          + "name" = "payments-system-0"
        }
   }
*/
