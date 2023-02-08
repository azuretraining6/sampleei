module "key_vault_01" {
  source              = "git::https://github.com/uhg-internal/azurerm_key_vault.git?ref=v0.0.1"
  key_vault_name      = var.environment == "dce" ? "kv-${var.team}-${var.environment}-${var.project}-09" : "kv-${var.team}-${var.environment}-${var.project}-01"
  location            = var.location
  resource_group_name = module.resource_group_01.output.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}
