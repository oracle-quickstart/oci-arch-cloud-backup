## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "RCLONE_CONFIG_OCI_TYPE" {
  value = "s3"
}

output "RCLONE_CONFIG_OCI_ACCESS_KEY_ID" {
  value = oci_identity_customer_secret_key.backup_user_customer_secret_key.key
}

output "RCLONE_CONFIG_OCI_SECRET_ACCESS_KEY" {
  value = data.oci_identity_customer_secret_keys.backup_user_customer_secret_keys.customer_secret_keys[0].id
}

output "RCLONE_CONFIG_OCI_REGION" {
  value = var.region
}

output "RCLONE_CONFIG_OCI_ENDPOINT" {
  value = "https://${data.oci_objectstorage_namespace.namespace.namespace}.compat.objectstorage.${var.region}.oraclecloud.com"
}
