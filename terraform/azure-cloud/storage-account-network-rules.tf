module "storage_account_network_rules_01" {
  source                                   = "git::https://github.com/uhg-internal/azurerm_storage_account_network_rules.git?ref=v0.0.1"
  storage_account_id                       = module.storage_account_01.output.id
  default_action                           = "Deny"
  ip_rules                                 = ["168.183.0.0/16", "149.111.0.0/16", "128.35.0.0/16", "161.249.0.0/16", "198.203.174.0/23", "198.203.176.0/22", "198.203.180.0/23", ]
  virtual_network_subnet_ids               = [module.subnet_storage_01.output.id, module.subnet_dbw_public_01.output.id, module.subnet_dbw_private_01.output.id]
}
