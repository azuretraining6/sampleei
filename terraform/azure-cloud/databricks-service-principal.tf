module "databricks_service_principal_01" {
  source         = "git::https://github.com/uhg-internal/databricks_service_principal.git?ref=v0.0.1"
  application_id = module.azuread_service_principal_01.output.object_id
}
