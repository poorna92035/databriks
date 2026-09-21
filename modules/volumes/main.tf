resource "databricks_volume" "databriks_volumes" {
  for_each = var.volumes
  catalog_name = var.catalog_name
  schema_name = each.value.schema
  name = "unstructured"
  volume_type = "EXTERNAL"
  storage_location = each.value.path
  comment = "Unstructured files"
}
