module "key_vault_access_policy_01" {
  source             = "git::https://github.com/uhg-internal/azurerm_key_vault_access_policy.git?ref=v0.0.1"
  key_vault_id       = module.key_vault_01.output.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = data.azurerm_client_config.current.object_id
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge", ]
}

module "key_vault_access_policy_02" {
  source             = "git::https://github.com/uhg-internal/azurerm_key_vault_access_policy.git?ref=v0.0.1"
  key_vault_id       = module.key_vault_01.output.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "••••••••••••••••••••••••••••"
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge", ]
}

module "key_vault_access_policy_03" {
  source             = "git::https://github.com/uhg-internal/azurerm_key_vault_access_policy.git?ref=v0.0.1"
  key_vault_id       = module.key_vault_01.output.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "•••••••••••••••••••••••••••"
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge", ]
}

module "key_vault_access_policy_04" {
  source             = "git::https://github.com/uhg-internal/azurerm_key_vault_access_policy.git?ref=v0.0.1"
  key_vault_id       = module.key_vault_01.output.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "**************************"
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge", ]
}

module "key_vault_access_policy_05" {
  source             = "git::https://github.com/uhg-internal/azurerm_key_vault_access_policy.git?ref=v0.0.1"
  key_vault_id       = module.key_vault_01.output.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "************************"
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge", ]
}