## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

data "oci_objectstorage_namespace" "namespace" {
  compartment_id = var.compartment_ocid
}

data "oci_identity_compartment" "backup_compartment" {
  id = var.compartment_ocid
}

data "oci_identity_region_subscriptions" "home_region_subscriptions" {
  tenancy_id = var.tenancy_ocid

  filter {
    name   = "is_home_region"
    values = [true]
  }
}

data "oci_identity_customer_secret_keys" "backup_user_customer_secret_keys" {
  user_id = oci_identity_customer_secret_key.backup_user_customer_secret_key.user_id
}
