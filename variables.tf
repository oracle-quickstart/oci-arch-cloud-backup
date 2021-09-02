## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "source_file" {
  default = ""
}

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


variable "lifecycle_policy_archive_rule_is_enabled" {
  default = true
}

variable "lifecycle_policy_archive_rule_name" {
  default = "archive_lifecycle_policy_rule_name"
}

variable "lifecycle_policy_archive_rule_time_amount" {
  default = 10
}

variable "lifecycle_policy_archive_rule_time_unit" {
  default = "DAYS"
}

variable "lifecycle_policy_archive_rule_inclusion_prefixes" {
  default = "my-test"
}

variable "lifecycle_policy_archive_rule_target" {
  default = "objects"
}


variable "lifecycle_policy_abort_rule_is_enabled" {
  default = true
}

variable "lifecycle_policy_abort_rule_name" {
  default = "abort_lifecycle_policy_rule_name"
}

variable "lifecycle_policy_abort_rule_time_amount" {
  default = 10
}

variable "lifecycle_policy_abort_rule_time_unit" {
  default = "DAYS"
}

variable "lifecycle_policy_abort_rule_target" {
  default = "multipart-uploads"
}

