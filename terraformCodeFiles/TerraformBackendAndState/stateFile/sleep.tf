resource "time_sleep" "sleep" {
  create_duration = "300s"
}

/*  
CMD 1

terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # time_sleep.sleep will be created
  + resource "time_sleep" "sleep" {
      + create_duration = "300s"
      + id              = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
time_sleep.sleep: Creating...
time_sleep.sleep: Still creating... [10s elapsed]
time_sleep.sleep: Still creating... [20s elapsed]
time_sleep.sleep: Still creating... [30s elapsed]
time_sleep.sleep: Still creating... [40s elapsed]
time_sleep.sleep: Still creating... [50s elapsed]
*/

/*  
CMD 2

>terraform plan
╷
│ Error: Error acquiring the state lock
│
│ Error message: Failed to read state file: The state file could not be read: read terraform.tfstate: The process
│ cannot access the file because another process has locked a portion of the file.
│
│ Terraform acquires a state lock to protect the state from being written
│ by multiple users at the same time. Please resolve the issue above and try
│ again. For most commands, you can disable locking with the "-lock=false"
│ flag, but this is not recommended.
*/

/*  
How does terraform know who have locked the state file
So when a file state is locked the information is stored in the  .terraform.tfstate.lock.info file
{"ID":"4161f33c-0197-7667-4571-55cbdddf7dd6","Operation":"OperationTypeApply","Info":"","Who":"DESKTOP-E4LQP9O\\Jash Varu@DESKTOP-E4LQP9O","Version":"1.9.2","Created":"2024-08-24T12:15:40.701781Z","Path":"terraform.tfstate"}
*/

/*  
We can also do force unlocking using command
*/
