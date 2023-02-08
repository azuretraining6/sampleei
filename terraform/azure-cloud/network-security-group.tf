module "network_security_group_01" {
  source              = "git::https://github.com/uhg-internal/azurerm_network_security_group.git?ref=v0.0.1"
  name                = "nsg-${var.team}-${var.environment}-${var.project}-01"
  location            = var.location
  resource_group_name = module.resource_group_01.output.name
}
