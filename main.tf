/* -------------------------------------------------------------------------- */
/*                        Alibaba Cloud billing export                        */
/* -------------------------------------------------------------------------- */

/* ------------------ Create the billing export OSS bucket ------------------ */
resource "alicloud_oss_bucket" "billing_export_bucket" {
  bucket        = var.oss_billing_export_bucket_name
  acl           = "private"
  force_destroy = true
}

/* ------------------------- Subscribe to each bill ------------------------- */
locals {
  bill_types = {
    BillingItemDetailForBillingPeriod = "Detailed bills of billable items",
    InstanceDetailForBillingPeriod    = "Detailed bills of instances",
    InstanceDetailMonthly             = "Instance-based bills summarized by billing cycle",
    BillingItemDetailMonthly          = "Billable item-based bills summarized by billing cycle",
    SplitItemDetailDaily              = "Split bills summarized by day",

    # MonthBill doesn't work (yet, maybe it need at least one complete month to be available)
    # MonthBill                       = "Monthly bill in the PDF format"
  }
}

resource "terraform_data" "subscribe_bill_to_oss" {
  for_each = local.bill_types
  input = {
    region      = var.region
    bill_type   = each.key
    bucket_name = alicloud_oss_bucket.billing_export_bucket.id
  }

  provisioner "local-exec" {
    command = "aliyun bssopenapi SubscribeBillToOSS --region ${self.input.region} --SubscribeBucket ${self.input.bucket_name} --SubscribeType ${self.input.bill_type} --BucketPath ${self.input.bill_type}"
    # The bssopenapi command is not yet available on Alibaba Cloud CLI for Linux
    interpreter = ["PowerShell", "-Command"]
  }
  provisioner "local-exec" {
    when    = destroy
    command = "aliyun bssopenapi UnsubscribeBillToOSS --region ${self.input.region} --SubscribeType ${self.input.bill_type}"
    # The bssopenapi command is not yet available on Alibaba Cloud CLI for Linux
    interpreter = ["PowerShell", "-Command"]
  }
}
