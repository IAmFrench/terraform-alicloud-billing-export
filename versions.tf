terraform {
  required_version = ">= 1.4.0"

  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = ">= 1.201.2"
    }
  }
}
