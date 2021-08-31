## Copyright (c) 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "null_resource" "exec_rclone_listremotes" {
  depends_on = [
    oci_objectstorage_bucket.bucket,
    oci_identity_group.backup_group,
    oci_identity_policy.backup_policy,
    oci_identity_user.backup_user,
    oci_identity_user_group_membership.backup_user_group_membership,
  oci_identity_customer_secret_key.backup_user_customer_secret_key]

  provisioner "local-exec" {
    command = "rclone listremotes"

    environment = {
      RCLONE_CONFIG_OCI_TYPE              = "s3"
      RCLONE_CONFIG_OCI_ACCESS_KEY_ID     = "${data.oci_identity_customer_secret_keys.backup_user_customer_secret_keys.customer_secret_keys[0].id}"
      RCLONE_CONFIG_OCI_SECRET_ACCESS_KEY = "${oci_identity_customer_secret_key.backup_user_customer_secret_key.key}"
      RCLONE_CONFIG_OCI_REGION            = "${var.region}"
      RCLONE_CONFIG_OCI_ENDPOINT          = "https://${data.oci_objectstorage_namespace.namespace.namespace}.compat.objectstorage.${var.region}.oraclecloud.com"
    }
  }
}

resource "null_resource" "exec_rclone_transfer" {
  depends_on = [null_resource.exec_rclone]

  provisioner "local-exec" {
    command = "rclone --verbose --cache-workers 64 --transfers 64 --retries 32 copy $SOURCE oci:${var.bucket_name}"

    environment = {
      RCLONE_CONFIG_OCI_TYPE              = "s3"
      RCLONE_CONFIG_OCI_ACCESS_KEY_ID     = "${data.oci_identity_customer_secret_keys.backup_user_customer_secret_keys.customer_secret_keys[0].id}"
      RCLONE_CONFIG_OCI_SECRET_ACCESS_KEY = "${oci_identity_customer_secret_key.backup_user_customer_secret_key.key}"
      RCLONE_CONFIG_OCI_REGION            = "${var.region}"
      RCLONE_CONFIG_OCI_ENDPOINT          = "https://${data.oci_objectstorage_namespace.namespace.namespace}.compat.objectstorage.${var.region}.oraclecloud.com"
      SOURCE                              = "${var.source_file}"
    }
  }
}
