## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

output "backup_user_customer_secret_keys" {
  value = [
    oci_identity_customer_secret_key.backup_user_customer_secret_key.key,
    data.oci_identity_customer_secret_keys.backup_user_customer_secret_keys.customer_secret_keys,
  ]
}

output "backup_user_customer_secret_key" {
  value = oci_identity_customer_secret_key.backup_user_customer_secret_key.key
}

output "backup_user_customer_access_key" {
  value = data.oci_identity_customer_secret_keys.backup_user_customer_secret_keys.customer_secret_keys[0].id
}
