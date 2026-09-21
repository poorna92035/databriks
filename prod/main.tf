module "storage_credential" {

  source = "../../modules/storage-credential"

  name     = local.storage_credential_name
  role_arn = var.role_arn
}

module "catalog" {

  source = "../../modules/catalog"

  catalog_name = local.catalog_name
}

module "schemas" {

  source = "../../modules/schemas"

  catalog_name = module.catalog.catalog_name

  schemas = local.schemas
}

module "external_locations" {

  source = "../../modules/external-locations"

  credential_name =  module.storage_credential.name

  locations = local.locations
}

module "volumes" {

  source = "../../modules/volumes"

  catalog_name =  module.catalog.catalog_name

  volumes = local.volumes
}

module "grants" {

  source = "../../modules/grants"

  catalog_name =  module.catalog.catalog_name

  principal = "account users"
}
