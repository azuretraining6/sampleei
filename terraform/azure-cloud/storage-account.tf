module "storage_account_01" {
  source                   = "git::https://github.com/uhg-internal/azurerm_storage_account.git?ref=v0.0.1"
  location                 = var.location
  resource_group_name      = module.resource_group_01.output.name
  name                     = "sa${var.team}${var.environment}${var.project}01"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

module "storage_account_02" {
  source                   = "git::https://github.com/uhg-internal/azurerm_storage_account.git?ref=v0.0.1"
  location                 = var.location
  resource_group_name      = module.resource_group_01.output.name
  name                     = "sa${var.team}${var.environment}${var.project}02"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}
