module "resource_group_01" {
  source   = "git::https://github.com/uhg-internal/azurerm_resource_group.git?ref=v0.0.1"
  name     = "rg-${var.team}-${var.environment}-${var.project}-01"
  location = var.location
}
