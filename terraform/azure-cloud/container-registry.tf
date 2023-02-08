module "container_registry_01" {
  source              = "git::https://github.com/uhg-internal/azurerm_container_registry.git?ref=v0.0.1"
  name                = "cr${var.team}${var.environment}${var.project}01"
  resource_group_name = module.resource_group_01.output.name
  location            = var.location
  sku                 = "Basic"
}
