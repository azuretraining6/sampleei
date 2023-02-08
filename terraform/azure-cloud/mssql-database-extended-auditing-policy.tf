module "mssql_database_extended_auditing_policy_01" {
  source                                  = "git::https://github.com/uhg-internal/azurerm_mssql_database_extended_auditing_policy?ref=v0.0.1"
  database_id                             = module.mssql_database_01.output.id
  storage_endpoint                        = module.storage_account_02.output.primary_blob_endpoint
  storage_account_access_key              = module.storage_account_02.output.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 6
}
