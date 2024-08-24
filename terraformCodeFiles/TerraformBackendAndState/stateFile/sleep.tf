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
