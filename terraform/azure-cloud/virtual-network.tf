module "virtual_network_01" {
  source              = "git::https://github.com/uhg-internal/azurerm_virtual_network.git?ref=v0.0.1"
  name                = "vnet-${var.team}-${var.environment}-${var.project}-01"
  resource_group_name = module.resource_group_01.output.name
  address_space       = ["10.100.0.0/16"]
  location            = var.location
}
