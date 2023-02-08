module "service_principal_databricks_role_assignment_01" {
  source               = "git::https://github.com/uhg-internal/azurerm_role_assignment.git?ref=v0.0.1"
  scope                = module.databricks_workspace_01.output.id
  role_definition_name = "Contributor"
  principal_id         = module.azuread_service_principal_01.output.object_id
}
