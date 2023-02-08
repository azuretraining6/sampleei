module "service_principal_password_01" {
  source               = "git::https://github.com/uhg-internal/azuread_service_principal_password.git?ref=v0.0.1"
  service_principal_id = module.azuread_service_principal_01.output.id
}
module "service_principal_password_02" {
  source               = "git::https://github.com/uhg-internal/azuread_service_principal_password.git?ref=v0.0.1"
  service_principal_id = module.azuread_service_principal_02.output.id
}
module "service_principal_password_03" {
  source               = "git::https://github.com/uhg-internal/azuread_service_principal_password.git?ref=v0.0.1"
  service_principal_id = module.azuread_service_principal_03.output.id
}