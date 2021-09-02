## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = var.compartment_ocid
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.namespace.namespace
  access_type    = var.bucket_access_type
  storage_tier   = var.bucket_storage_tier
}


resource "oci_objectstorage_object_lifecycle_policy" "LifecyclePolicy" {
  namespace = data.oci_objectstorage_namespace.namespace.namespace
  bucket    = oci_objectstorage_bucket.bucket.name

  rules {
    action      = "ARCHIVE"
    is_enabled  = var.lifecycle_policy_archive_rule_is_enabled
    name        = var.lifecycle_policy_archive_rule_name
    time_amount = var.lifecycle_policy_archive_rule_time_amount
    time_unit   = var.lifecycle_policy_archive_rule_time_unit

    object_name_filter {
      inclusion_prefixes = [var.lifecycle_policy_archive_rule_inclusion_prefixes]
    }

    target = var.lifecycle_policy_archive_rule_target
  }

  rules {
    action      = "ABORT"
    is_enabled  = var.lifecycle_policy_abort_rule_is_enabled
    name        = var.lifecycle_policy_abort_rule_name
    time_amount = var.lifecycle_policy_abort_rule_time_amount
    time_unit   = var.lifecycle_policy_abort_rule_time_unit

    target = var.lifecycle_policy_abort_rule_target
  }

}

