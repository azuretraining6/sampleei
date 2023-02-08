module "mssql_virtual_network_rule_01" {
  source    = "git::https://github.com/uhg-internal/azurerm_mssql_virtual_network_rule.git?ref=v0.0.1"
  name      = "sql-vnet-rule"
  server_id = module.mssql_server_01.output.id
  subnet_id = module.subnet_dbw_public_01.output.id
}
