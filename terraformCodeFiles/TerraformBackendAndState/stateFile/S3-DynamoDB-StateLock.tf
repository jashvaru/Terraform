terraform {
  backend "s3" {

    bucket         = "jash-s3-bucket"
    key            = "network/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform_state_lock"
  }
}

resource "time_sleep" "sleep" {
  create_duration = "150s"
}

/*  
S3 backend does not support state locking for state locking we need to use dynamoDB
DynamoDB is used to store state locking information

When we add dynamodb table details after s3 bucket is created it will give below error
terraform plan

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

D:\Learning\Terraform\executeTerraformCode>
D:\Learning\Terraform\executeTerraformCode>
D:\Learning\Terraform\executeTerraformCode>terraform init
Initializing the backend...
╷
│ Error: Backend configuration changed
│
│ A change in the backend configuration has been detected, which may require migrating existing state.
│
│ If you wish to attempt automatic migration of the state, use "terraform init -migrate-state".
│ If you wish to store the current configuration with no changes to the state, use "terraform init -reconfigure".
╵

D:\Learning\Terraform\executeTerraformCode>terraform init -reconfigure
Initializing the backend...

Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.
Initializing provider plugins...
Terraform has made some changes to the provider dependency selections recorded
in the .terraform.lock.hcl file. Review those changes and commit them to your
version control system if they represent changes you intended to make.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

*/


/*
If from 2nd CMD we try to accquire lock it will read state lock file from dynamoDB and show below error
  
terraform plan
╷
│ Error: Error acquiring the state lock
│
│ Error message: operation error DynamoDB: PutItem, https response error StatusCode: 400, RequestID:
│ 94HMLCPPTPAQS7BC4SN3AOF0SBVV4KQNSO5AEMVJF66Q9ASUAAJG, ConditionalCheckFailedException: The conditional request failed
│ Lock Info:
│   ID:        f54b019f-c8fc-4da9-46c9-39ec24a19b85
│   Path:      jash-s3-bucket/network/terraform.tfstate
│   Operation: OperationTypeApply
│   Who:       DESKTOP-E4LQP9O\Jash Varu@DESKTOP-E4LQP9O
│   Version:   1.9.2
│   Created:   2024-08-24 12:43:12.4896792 +0000 UTC
│   Info:
│
│
│ Terraform acquires a state lock to protect the state from being written
│ by multiple users at the same time. Please resolve the issue above and try
│ again. For most commands, you can disable locking with the "-lock=false"
│ flag, but this is not recommended.
╵
*/


/*  
The requested item cannot be found with the jash-s3-bucket/network/terraform.tfstate primary key.
*/
