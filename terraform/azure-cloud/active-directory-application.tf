module "azuread_application_01" {
  source       = "git::https://github.com/uhg-internal/azuread_application.git?ref=v0.0.1"
  display_name = "sp-${var.team}-${var.environment}-${var.project}-01"
  owners       = [data.azurerm_client_config.current.object_id]
}
// service principal for sql warehouse to adls
module "azuread_application_02" {
  source       = "git::https://github.com/uhg-internal/azuread_application.git?ref=v0.0.1"
  display_name = "sp-${var.team}-${var.environment}-${var.project}-sql-01"
  owners       = [data.azurerm_client_config.current.object_id]
}
// service principal for datafactory pipeline
module "azuread_application_03" {
  source       = "git::https://github.com/uhg-internal/azuread_application.git?ref=v0.0.1"
  display_name = "sp-${var.team}-${var.environment}-${var.project}-df-01"
  owners       = [data.azurerm_client_config.current.object_id]
}