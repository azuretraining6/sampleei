module "app_service_plan_01" {
  source              = "git::https://github.com/uhg-internal/azurerm_app_service_plan.git?ref=v0.0.2"
  name                = "asp-${var.team}-${var.environment}-${var.project}-01"
  location            = var.location
  resource_group_name = module.resource_group_01.output.name

  sku = {
    tier = "Standard"
    size = "S1"
  }
}
