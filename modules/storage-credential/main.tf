resource "databricks_storage_credential" "st_ce" {
  name = var.name
  aws_iam_role {
    role_arn = var.role_arn
  }
  comment = "AB Claims Storage Credential"
}
