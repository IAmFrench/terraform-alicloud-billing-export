variable "oss_billing_export_bucket_name" {
  type        = string
  description = "Name used for the OSS billing bucket."
  nullable    = false
}

variable "region" {
  type        = string
  description = "The region used to launch this module resources."
  nullable    = false
}
