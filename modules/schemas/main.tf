resource "databricks_schema" "dmaas_schemas" {
  for_each = toset(var.schemas)
  catalog_name = var.catalog_name
  name = each.key
  comment = "Managed by Terraform"
}
