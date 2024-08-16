resource "local_file" "foo" {
  content  = "Hello world!"
  filename = "${path.module}/foo.txt"
}

/* 
terraform plan -out infra.plan 
terraform show infra.plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # local_file.foo will be created
  + resource "local_file" "foo" {
      + content              = "Hello world!"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./foo.txt"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
*/

//--------------------------------------------------------------------------------------------------------------------------------

/*  
terraform show -json infra.plan
{"format_version":"1.2","terraform_version":"1.9.2","planned_values":{"root_module":{"resources":[{"address":"local_file.foo","mode":"managed","type":"local_file","name":"foo","provider_name":"registry.terraform.io/hashicorp/local","schema_version":0,"values":{"content":"Hello world!","content_base64":null,"directory_permission":"0777","file_permission":"0777","filename":"./foo.txt","sensitive_content":null,"source":null},"sensitive_values":{"sensitive_content":true}}]}},"resource_changes":[{"address":"local_file.foo","mode":"managed","type":"local_file","name":"foo","provider_name":"registry.terraform.io/hashicorp/local","change":{"actions":["create"],"before":null,"after":{"content":"Hello world!","content_base64":null,"directory_permission":"0777","file_permission":"0777","filename":"./foo.txt","sensitive_content":null,"source":null},"after_unknown":{"content_base64sha256":true,"content_base64sha512":true,"content_md5":true,"content_sha1":true,"content_sha256":true,"content_sha512":true,"id":true},"before_sensitive":false,"after_sensitive":{"sensitive_content":true}}}],"configuration":{"provider_config":{"aws":{"name":"aws","full_name":"registry.terraform.io/hashicorp/aws","expressions":{"region":{"constant_value":"ap-south-1"}}},"local":{"name":"local","full_name":"registry.terraform.io/hashicorp/local"}},"root_module":{"resources":[{"address":"local_file.foo","mode":"managed","type":"local_file","name":"foo","provider_config_key":"local","expressions":{"content":{"constant_value":"Hello world!"},"filename":{"references":["path.module"]}},"schema_version":0}]}},"timestamp":"2024-08-16T10:06:00Z","applyable":true,"complete":true,"errored":false}
*/

//--------------------------------------------------------------------------------------------------------------------------------

/* 
install jq from https://jqlang.github.io/jq/download/
rename it to jq.exe and add to env var
terraform show -json infra.plan | jq
{
  "format_version": "1.2",
  "terraform_version": "1.9.2",
  "planned_values": {
    "root_module": {
      "resources": [
        {
          "address": "local_file.foo",
          "mode": "managed",
          "type": "local_file",
          "name": "foo",
          "provider_name": "registry.terraform.io/hashicorp/local",
          "schema_version": 0,
          "values": {
            "content": "Hello world!",
            "content_base64": null,
            "directory_permission": "0777",
            "file_permission": "0777",
            "filename": "./foo.txt",
            "sensitive_content": null,
            "source": null
          },
          "sensitive_values": {
            "sensitive_content": true
          }
        }
      ]
    }
  },
  "resource_changes": [
    {
      "address": "local_file.foo",
      "mode": "managed",
      "type": "local_file",
      "name": "foo",
      "provider_name": "registry.terraform.io/hashicorp/local",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "content": "Hello world!",
          "content_base64": null,
          "directory_permission": "0777",
          "file_permission": "0777",
          "filename": "./foo.txt",
          "sensitive_content": null,
          "source": null
        },
        "after_unknown": {
          "content_base64sha256": true,
          "content_base64sha512": true,
          "content_md5": true,
          "content_sha1": true,
          "content_sha256": true,
          "content_sha512": true,
          "id": true
        },
        "before_sensitive": false,
        "after_sensitive": {
          "sensitive_content": true
        }
      }
    }
  ],
  "configuration": {
    "provider_config": {
      "aws": {
        "name": "aws",
        "full_name": "registry.terraform.io/hashicorp/aws",
        "expressions": {
          "region": {
            "constant_value": "ap-south-1"
          }
        }
      },
      "local": {
        "name": "local",
        "full_name": "registry.terraform.io/hashicorp/local"
      }
    },
    "root_module": {
      "resources": [
        {
          "address": "local_file.foo",
          "mode": "managed",
          "type": "local_file",
          "name": "foo",
          "provider_config_key": "local",
          "expressions": {
            "content": {
              "constant_value": "Hello world!"
            },
            "filename": {
              "references": [
                "path.module"
              ]
            }
          },
          "schema_version": 0
        }
      ]
    }
  },
  "timestamp": "2024-08-16T10:06:00Z",
  "applyable": true,
  "complete": true,
  "errored": false
} 
*/
