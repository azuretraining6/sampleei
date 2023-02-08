module "subnet_network_security_group_association_storage_01" {
  source                    = "git::https://github.com/uhg-internal/azurerm_subnet_network_security_group_association.git?ref=v0.0.1"
  subnet_id                 = module.subnet_storage_01.output.id
  network_security_group_id = module.network_security_group_01.output.id
}

module "subnet_network_security_group_association_dbw_public_01" {
  source                    = "git::https://github.com/uhg-internal/azurerm_subnet_network_security_group_association.git?ref=v0.0.1"
  subnet_id                 = module.subnet_dbw_public_01.output.id
  network_security_group_id = module.network_security_group_01.output.id
}

module "subnet_network_security_group_association_dbw_private_01" {
  source                    = "git::https://github.com/uhg-internal/azurerm_subnet_network_security_group_association.git?ref=v0.0.1"
  subnet_id                 = module.subnet_dbw_private_01.output.id
  network_security_group_id = module.network_security_group_01.output.id
}

