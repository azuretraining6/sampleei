module "databricks_workspace_01" {
  source                        = "git::https://github.com/uhg-internal/azurerm_databricks_workspace.git?ref=v0.0.1"
  name                          = "dbw-${var.team}-${var.environment}-${var.project}-01"
  resource_group_name           = module.resource_group_01.output.name
  location                      = var.location
  sku                           = "premium"
  public_network_access_enabled = true
  managed_resource_group_name   = "rg-managed-dbw-${var.team}-${var.environment}-${var.project}-01"
  
  custom_parameters = {
    virtual_network_id                                   = module.virtual_network_01.output.id
    public_subnet_name                                   = module.subnet_dbw_public_01.output.name
    public_subnet_network_security_group_association_id  = module.subnet_network_security_group_association_dbw_public_01.output.id
    private_subnet_name                                  = module.subnet_dbw_private_01.output.name
    private_subnet_network_security_group_association_id = module.subnet_network_security_group_association_dbw_private_01.output.id
    nat_gateway_name                                     = null
    public_ip_name                                       = null
    no_public_ip                                         = null
    storage_account_name                                 = null
    storage_account_sku_name                             = null
    virtual_network_address_space                        = null
    vnet_address_prefix                                  = null
  }
}
