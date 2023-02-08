module "data_factory_01" {
  source              = "git::https://github.com/uhg-internal/azurerm_data_factory.git?ref=v0.0.1"
  name                = "df-${var.team}-${var.environment}-${var.project}-01"
  location            = var.location
  resource_group_name = module.resource_group_01.output.name

  github_configuration = var.environment == "dev" ? {
    account_name    = "optum-financial"
    branch_name     = "develop"
    git_url         = "https://github.com"
    repository_name = "eandi-datafactory-repo"
    root_folder     = "/"
  } : null
}
