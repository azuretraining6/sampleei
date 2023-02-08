module "data_lake_01" {
  source             = "git::https://github.com/uhg-internal/azurerm_storage_data_lake_gen2_filesystem.git?ref=v0.0.1"
  name               = "dl-${var.team}-${var.environment}-${var.project}-01"
  storage_account_id = module.storage_account_01.output.id
}
