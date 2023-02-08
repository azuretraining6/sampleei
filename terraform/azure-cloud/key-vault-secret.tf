module "key_vault_secret_01" {
  source       = "git::https://github.com/uhg-internal/azurerm_key_vault_secret.git?ref=v0.0.3"
  depends_on   = [module.key_vault_access_policy_01]
  name         = "sql-server-admin-password"
  value        = module.random_password_01.output.result
  content_type = "Password to connect databricks to MS-SQL"
  key_vault_id = module.key_vault_01.output.id
}

module "key_vault_secret_02" {
  source       = "git::https://github.com/uhg-internal/azurerm_key_vault_secret.git?ref=v0.0.3"
  depends_on   = [module.service_principal_password_01]
  name         = "${module.azuread_service_principal_01.output.display_name}-secret"
  value        = module.service_principal_password_01.output.value
  content_type = "Password for ${module.azuread_service_principal_01.output.display_name} service principal"
  key_vault_id = module.key_vault_01.output.id
}
module "key_vault_secret_03" {
  source       = "git::https://github.com/uhg-internal/azurerm_key_vault_secret.git?ref=v0.0.3"
  depends_on   = [module.service_principal_password_02]
  name         = "${module.azuread_service_principal_02.output.display_name}-secret"
  value        = module.service_principal_password_02.output.value
  content_type = "Password for ${module.azuread_service_principal_02.output.display_name} service principal"
  key_vault_id = module.key_vault_01.output.id
}
module "key_vault_secret_04" {
  source       = "git::https://github.com/uhg-internal/azurerm_key_vault_secret.git?ref=v0.0.3"
  depends_on   = [module.service_principal_password_03]
  name         = "${module.azuread_service_principal_03.output.display_name}-secret"
  value        = module.service_principal_password_03.output.value
  content_type = "Password for ${module.azuread_service_principal_03.output.display_name} service principal"
  key_vault_id = module.key_vault_01.output.id
}
