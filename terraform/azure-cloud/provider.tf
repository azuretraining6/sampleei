terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.1.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.28.1"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "databricks" {
  host                        = module.databricks_workspace_01.output.workspace_url
  azure_workspace_resource_id = module.databricks_workspace_01.output.id
}
