terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.56"
    }
  }
}

provider "databricks" {
  host  = "https://dbc-d9021e0b-caad.cloud.databricks.com/"
  token = "aeb908ae979a699755ad819dcfb141dd0bee941e55486865d2f7a4d1fd7d9622"
}
