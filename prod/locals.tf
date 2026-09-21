locals {

  catalog_name = "cat_rnd_ab_claims_edp_ai"

  storage_credential_name =
  "cred_ab_claims_rnd_edp_ai_prod"

  usecases = {

    documind = {
      poc = "s3://rnd-pr-ab-claims-dbx-edp-ai/poc-documind"
      wrk = "s3://rnd-pr-ab-claims-dbx-edp-ai/wrk-documind"
    }

    inver = {
      poc = "s3://rnd-pr-ab-claims-dbx-edp-ai/poc_inver"
      wrk = "s3://rnd-pr-ab-claims-dbx-edp-ai/wrk_inver"
    }

    legacy = {
      poc = "s3://rnd-pr-ab-claims-dbx-edp-ai/poc_legacy"
      wrk = "s3://rnd-pr-ab-claims-dbx-edp-ai/wrk_legacy"
    }

    settlement_assist = {
      poc = "s3://rnd-pr-ab-claims-dbx-edp-ai/poc_setassist"
      wrk = "s3://rnd-pr-ab-claims-dbx-edp-ai/wrk_setassist"
    }

    dmaas = {
      poc = "s3://rnd-pr-ab-claims-dbx-edp-ai/poc_dmaas"
      wrk = "s3://rnd-pr-ab-claims-dbx-edp-ai/wrk_dmaas"
    }
  }

  schemas = flatten([
    for k, v in local.usecases : [
      "sch_poc_${k}",
      "sch_wrk_${k}"
    ]
  ])

  locations = merge(

    {
      for k, v in local.usecases :
      "loc_edp_ai_rnd_ab_claims_poc_${k}" => v.poc
    },

    {
      for k, v in local.usecases :
      "loc_edp_ai_rnd_ab_claims_wrk_${k}" => v.wrk
    }
  )

  volumes = merge(

    {
      for k, v in local.usecases :

      "sch_poc_${k}" => {
        schema = "sch_poc_${k}"
        path   = "${v.poc}/vol/unstructured"
      }
    },

    {
      for k, v in local.usecases :

      "sch_wrk_${k}" => {
        schema = "sch_wrk_${k}"
        path   = "${v.wrk}/vol/unstructured"
      }
    }
  )
}
