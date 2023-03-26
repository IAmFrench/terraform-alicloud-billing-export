# Alibaba Cloud Billing export Terraform Module

Terraform Module witch creates billing export on Alibaba Cloud.

This module will create an OSS bucket for billing data and will enable [all billing exports](https://next.api.alibabacloud.com/document/BssOpenApi/2017-12-14/SubscribeBillToOSS) supported by Alibaba Cloud.

## Known limitations

- It use the Alibaba Cloud CLI to subscribe to bills.
- It need to run with the Windows-based Alibaba Cloud CLI as the `aliyun bssopenapi SubscribeBillToOSS` command is not supported on Linux (tested with CLI version `3.0.2`).
- You will need to wait ~30s to view new bill folders in your OSS bucket.
- You can only have one export per bill type, you may first need to run this next command `aliyun bssopenapi UnsubscribeBillToOSS --region YOUR-REGION-HERE --SubscribeType BILL-TYPE-HERE`.
- On destroy, this module will unsubscribe to bill.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.201.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.201.2 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_oss_bucket.billing_export_bucket](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oss_bucket) | resource |
| [terraform_data.subscribe_bill_to_oss](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oss_billing_export_bucket_name"></a> [oss\_billing\_export\_bucket\_name](#input\_oss\_billing\_export\_bucket\_name) | Name used for the OSS billing bucket. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region used to launch this module resources. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
