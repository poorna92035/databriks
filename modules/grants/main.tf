resource "databricks_grants" "grant_catalog" {

  catalog = var.catalog_name
  grant {
    principal = var.principal
    privileges = [
      "USE_CATALOG",
      "CREATE_SCHEMA"
    ]
  }
}
