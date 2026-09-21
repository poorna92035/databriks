resource "databricks_external_location" "dmaas_el" {
  for_each = var.locations
  name = each.key
  url = each.value
  credential_name = var.credential_name
  comment = "Managed by Terraform"
}
