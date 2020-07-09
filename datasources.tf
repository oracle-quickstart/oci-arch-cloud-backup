## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

data "oci_objectstorage_namespace" "namespace" {
    compartment_id = var.compartment_ocid
}

data "oci_identity_compartment" "backup_compartment" {
    id = var.compartment_ocid
}