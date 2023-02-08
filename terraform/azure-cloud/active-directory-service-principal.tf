module "azuread_service_principal_01" {
  source                       = "git::https://github.com/uhg-internal/azuread_service_principal.git?ref=v0.0.1"
  application_id               = module.azuread_application_01.output.application_id
  owners                       = [data.azurerm_client_config.current.object_id]
}
module "azuread_service_principal_02" {
  source                       = "git::https://github.com/uhg-internal/azuread_service_principal.git?ref=v0.0.1"
  application_id               = module.azuread_application_02.output.application_id
  owners                       = [data.azurerm_client_config.current.object_id]
}
module "azuread_service_principal_03" {
  source                       = "git::https://github.com/uhg-internal/azuread_service_principal.git?ref=v0.0.1"
  application_id               = module.azuread_application_03.output.application_id
  owners                       = [data.azurerm_client_config.current.object_id]
}