data "databricks_group" "admins" {
  display_name = "admins"
  depends_on   = [module.databricks_workspace_01]
}

module "databricks_group_member_01" {
  source    = "git::https://github.com/uhg-internal/databricks_group_member.git?ref=v0.0.1"
  group_id  = data.databricks_group.admins.id
  member_id = module.databricks_service_principal_01.output.id
}
