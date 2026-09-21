resource "databricks_catalog" "this" {
  name         = var.catalog_name
  comment      = "AB Claims EDP AI Catalog"
  force_destroy = true
}
