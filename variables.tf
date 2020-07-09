## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "region" {}
variable "user_ocid" {} #Comment when creating Resource Manager zip file
variable "tenancy_ocid" {}

variable "compartment_ocid" {}
variable "bucket_name" {}
variable "bucket_access_type" {} 
variable "bucket_storage_tier" {}

variable "group_name" {}
variable "group_description" {}
variable "policy_name" {}
variable "policy_description" {}
variable "backupuser_name" {}