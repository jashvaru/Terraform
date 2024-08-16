provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
}

/*  
To enable trace in terraform add the env variable as "TF_LOG" : TRACE (TRACE, DEBUG, INFO, WARN, ERROR)
Once you do that you will get logs getting printed while running terraform plan command

Sample
2024-08-16T08:32:36.328+0530 [TRACE] provider.terraform-provider-aws_v5.62.0_x5.exe: Found resource type: tf_resource_type=aws_s3control_bucket_lifecycle_configuration tf_rpc=GetProviderSchema @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.34.0/helper/schema/grpc_provider.go:128 tf_mux_provider="*schema.GRPCProviderServer" @module=sdk.helper_schema tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=5d464c00-0e68-b7cb-6217-cc6a02eabdcb timestamp="2024-08-16T08:32:36.328+0530"
2024-08-16T08:32:36.328+0530 [TRACE] provider.terraform-provider-aws_v5.62.0_x5.exe: Found resource type: @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.34.0/helper/schema/grpc_provider.go:128 @module=sdk.helper_schema tf_provider_addr=registry.terraform.io/hashicorp/aws tf_resource_type=aws_appautoscaling_target tf_mux_provider="*schema.GRPCProviderServer" tf_req_id=5d464c00-0e68-b7cb-6217-cc6a02eabdcb tf_rpc=GetProviderSchema timestamp="2024-08-16T08:32:36.328+0530"
2024-08-16T08:32:36.328+0530 [TRACE] provider.terraform-provider-aws_v5.62.0_x5.exe: Found resource type: @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.34.0/helper/schema/grpc_provider.go:128 tf_mux_provider="*schema.GRPCProviderServer" tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=5d464c00-0e68-b7cb-6217-cc6a02eabdcb tf_rpc=GetProviderSchema @module=sdk.helper_schema tf_resource_type=aws_location_tracker_association timestamp="2024-08-16T08:32:36.328+0530"
2024-08-16T08:32:36.328+0530 [TRACE] provider.terraform-provider-aws_v5.62.0_x5.exe: Found resource type: @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.34.0/helper/schema/grpc_provider.go:128 tf_mux_provider="*schema.GRPCProviderServer" tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=5d464c00-0e68-b7cb-6217-cc6a02eabdcb tf_resource_type=aws_servicecatalog_tag_option_resource_association tf_rpc=GetProviderSchema @module=sdk.helper_schema timestamp="2024-08-16T08:32:36.328+0530"
2024-08-16T08:32:36.328+0530 [TRACE] provider.terraform-provider-aws_v5.62.0_x5.exe: Found resource type: @module=sdk.helper_schema tf_req_id=5d464c00-0e68-b7cb-6217-cc6a02eabdcb tf_rpc=GetProviderSchema @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.34.0/helper/schema/grpc_provider.go:128 tf_provider_addr=registry.terraform.io/hashicorp/aws tf_resource_type=aws_ssm_patch_group tf_mux_provider="*schema.GRPCProviderServer" timestamp="2024-08-16T08:32:36.328+0530"
2024-08-16T08:32:36.328+0530 [TRACE] provider.terraform-provider-aws_v5.62.0_x5.exe: Found resource type: tf_resource_type=aws_ssoadmin_permission_set_inline_policy tf_rpc=GetProviderSchema tf_mux_provider="*schema.GRPCProviderServer" tf_provider_addr=registry.terraform.io/hashicorp/aws tf_req_id=5d464c00-0e68-b7cb-6217-cc6a02eabdcb @caller=github.com/hashicorp/terraform-plugin-sdk/v2@v2.34.0/helper/schema/grpc_provider.go:128 @module=sdk.helper_schema timestamp="2024-08-16T08:32:36.328+0530"
*/
