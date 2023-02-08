module "subnet_dbw_public_01" {
  source               = "git::https://github.com/uhg-internal/azurerm_subnet.git?ref=v0.0.1"
  name                 = "snet-${var.team}-${var.environment}-${var.project}-dbw-public-01"
  resource_group_name  = module.resource_group_01.output.name
  virtual_network_name = module.virtual_network_01.output.name
  address_prefixes     = ["10.100.1.0/24"]
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql",]

  delegation = {
    name = "databricks-public-delegation"

    service_delegation = {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

module "subnet_dbw_private_01" {
  source               = "git::https://github.com/uhg-internal/azurerm_subnet.git?ref=v0.0.1"
  name                 = "snet-${var.team}-${var.environment}-${var.project}-dbw-private-01"
  resource_group_name  = module.resource_group_01.output.name
  virtual_network_name = module.virtual_network_01.output.name
  address_prefixes     = ["10.100.2.0/24"]
  service_endpoints    = ["Microsoft.Storage", ]

  delegation = {
    name = "databricks-private-delegation"

    service_delegation = {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

module "subnet_storage_01" {
  source               = "git::https://github.com/uhg-internal/azurerm_subnet.git?ref=v0.0.1"
  name                 = "snet-${var.team}-${var.environment}-${var.project}-storage-01"
  resource_group_name  = module.resource_group_01.output.name
  virtual_network_name = module.virtual_network_01.output.name
  address_prefixes     = ["10.100.3.0/24"]
  service_endpoints    = ["Microsoft.Storage", ]
}
