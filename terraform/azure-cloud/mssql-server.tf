module "mssql_server_01" {
  source                       = "git::https://github.com/uhg-internal/azurerm_mssql_server.git?ref=v0.0.1"
  name                         = "mssqlsrv-${var.team}-${var.environment}-${var.project}-01"
  resource_group_name          = module.resource_group_01.output.name
  location                     = var.location
  mssql_server_version         = "12.0"
  administrator_login          = "sql-server-admin"
  administrator_login_password = module.random_password_01.output.result
  minimum_tls_version          = "1.2"

  azuread_administrator = {
    azuread_authentication_only = false
    login_username              = "pcomerf1@optumcloud.com"
    object_id                   = "10642ec6-65cd-4602-a721-872a562d0bf8"
    tenant_id                   = "db05faca-c82a-4b9d-b9c5-0f64b6755421"
  }
}
