module "mssql_database_01" {
  source    = "git::https://github.com/uhg-internal/azurerm_mssql_database.git?ref=v0.0.1"
  name      = "mssqldb-${var.team}-${var.environment}-${var.project}-01"
  server_id = module.mssql_server_01.output.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = "S0"
}
