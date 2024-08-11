data "aws_instances" "foo" {}

/*  
Its reads ec2 instance details from aws
Since no instance is running it is showing empty values
{
  "version": 4,
  "terraform_version": "1.9.2",
  "serial": 47,
  "lineage": "fc29ad69-bb71-0e16-3a2d-b504bccbb538",
  "outputs": {},
  "resources": [
    {
      "mode": "data",
      "type": "aws_instances",
      "name": "foo",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "filter": null,
            "id": "ap-south-1",
            "ids": [],
            "instance_state_names": null,
            "instance_tags": null,
            "ipv6_addresses": [],
            "private_ips": [],
            "public_ips": [],
            "timeouts": null
          },
          "sensitive_attributes": []
        }
      ]
    }
  ],
  "check_results": null
}

*/
