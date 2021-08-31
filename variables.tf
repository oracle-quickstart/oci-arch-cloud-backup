## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "source_file" {}

variable "compartment_ocid" {}

variable "bucket_name" {
  default = "BackupBucket"
}

variable "bucket_access_type" {
  default = "NoPublicAccess"
}

variable "bucket_storage_tier" {
  default = "Standard"
}

variable "group_name" {
  default = "IAMGroup4OSS"
}

variable "group_description" {
  default = "IAM Group for OSS"
}

variable "policy_name" {
  default = "IAMPolicy4OSS"
}

variable "policy_description" {
  default = "IAM Policy for OSS"
}
variable "backupuser_name" {
  default = "backupuser"
}

variable "secret_key_name" {
  default = "IAMUserSecretKey4OSS"
}
