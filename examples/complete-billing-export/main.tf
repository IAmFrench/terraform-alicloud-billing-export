provider "alicloud" {
  region     = local.region
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
}

locals {
  region                         = "ap-southeast-1"
  oss_billing_export_bucket_name = "test-billing-export-w3c2s"
}

/* -------------------------------------------------------------------------- */
/*                            Cloud billing export                            */
/* -------------------------------------------------------------------------- */

module "alibaba_billing_export" {
  source                         = "../../"
  region                         = local.region
  oss_billing_export_bucket_name = local.oss_billing_export_bucket_name
}
