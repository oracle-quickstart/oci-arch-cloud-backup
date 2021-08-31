## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_identity_group" "backup_group" {
  provider       = oci.homeregion
  compartment_id = var.tenancy_ocid
  description    = var.group_description
  name           = var.group_name
}

resource "oci_identity_policy" "backup_policy" {
  depends_on     = [oci_identity_group.backup_group]
  provider       = oci.homeregion
  compartment_id = var.tenancy_ocid
  description    = var.policy_description
  name           = var.policy_name
  statements = [
    "Allow group ${var.group_name} to manage objects in tenancy where target.bucket.name = '${var.bucket_name}'",
    "Allow group ${var.group_name} to read buckets in tenancy"
  ]
}

resource "oci_identity_user" "backup_user" {
  provider       = oci.homeregion
  compartment_id = var.tenancy_ocid
  description    = "Backup user"
  name           = var.backupuser_name
}

resource "oci_identity_user_group_membership" "backup_user_group_membership" {
  provider       = oci.homeregion
  compartment_id = var.tenancy_ocid
  user_id        = oci_identity_user.backup_user.id
  group_id       = oci_identity_group.backup_group.id
}

resource "oci_identity_customer_secret_key" "backup_user_customer_secret_key" {
  user_id      = oci_identity_user.backup_user.id
  display_name = var.secret_key_name
}

