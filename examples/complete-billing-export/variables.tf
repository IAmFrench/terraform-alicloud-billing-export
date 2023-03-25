variable "alicloud_access_key" {
  type        = string
  description = "Alibaba Cloud access key"
  nullable    = false
  sensitive   = true
}

variable "alicloud_secret_key" {
  type        = string
  description = "Alibaba Cloud secret key"
  nullable    = false
  sensitive   = true
}
