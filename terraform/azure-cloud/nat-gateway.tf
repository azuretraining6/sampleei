resource "azurerm_public_ip" "public_ip_1" {
  name                = "public-ip-${var.team}-${var.environment}-${var.project}-01"
  location            = var.location
  resource_group_name = module.resource_group_01.output.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "nat_gateway_1" {
  name                    = "nat-gateway-${var.team}-${var.environment}-${var.project}-01"
  location                = var.location
  resource_group_name     = module.resource_group_01.output.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}

resource "azurerm_nat_gateway_public_ip_association" "nat_ip_association_1" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway_1.id
  public_ip_address_id = azurerm_public_ip.public_ip_1.id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_nat_association_1" {
  subnet_id      = module.subnet_dbw_private_01.output.id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway_1.id
}