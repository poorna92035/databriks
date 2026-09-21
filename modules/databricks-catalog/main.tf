resource "databricks_catalog" "dmaas_catalog" {
  name         = var.catalog_name
  comment      = "AB Claims EDP AI Catalog"
  force_destroy = true
}
