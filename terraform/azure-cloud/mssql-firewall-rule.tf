module "mssql_firewall_rule_01" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule01"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "168.183.0.0"
  end_ip_address   = "168.183.255.255"
}

module "mssql_firewall_rule_02" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule02"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "149.111.0.0"
  end_ip_address   = "149.111.255.255"
}

module "mssql_firewall_rule_03" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule03"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "128.35.0.0"
  end_ip_address   = "128.35.255.255"
}

module "mssql_firewall_rule_04" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule04"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "161.249.0.0"
  end_ip_address   = "161.249.255.255"
}

module "mssql_firewall_rule_05" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule05"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "198.203.174.0"
  end_ip_address   = "198.203.175.255"
}

module "mssql_firewall_rule_06" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule06"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "198.203.176.0"
  end_ip_address   = "198.203.179.255"
}

module "mssql_firewall_rule_07" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule07"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "198.203.180.0"
  end_ip_address   = "198.203.181.255"
}

module "mssql_firewall_rule_08" {
  source           = "git::https://github.com/uhg-internal/azurerm_mssql_firewall_rule.git"
  name             = "FirewallRule08"
  server_id        = module.mssql_server_01.output.id
  start_ip_address = "20.41.4.235"
  end_ip_address   = "20.41.4.235"
}
