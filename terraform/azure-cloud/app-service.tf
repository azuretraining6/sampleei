module "app_service_01" {
  source              = "git::https://github.com/uhg-internal/azurerm_app_service.git?ref=v0.0.3"
  name                = "as-${var.team}-${var.environment}-${var.project}-01"
  location            = var.location
  resource_group_name = module.resource_group_01.output.name
  app_service_plan_id = module.app_service_plan_01.output.id
  https_only          = true

  site_config = {
    php_version               = "5.6"
    use_32_bit_worker_process = true
    http2_enabled             = true

    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
      "hostingstart.html",
    ]

    ip_restriction = [
      {
        ip_address = "168.183.0.0/16"
        priority   = 100
        name       = "Rule 0"
        action     = "Allow"
      },
      {
        ip_address = "149.111.0.0/16"
        priority   = 101
        name       = "Rule 1"
        action     = "Allow"
      },
      {
        ip_address = "128.35.0.0/16"
        priority   = 102
        name       = "Rule 2"
        action     = "Allow"
      },
      {
        ip_address = "161.249.0.0/16"
        priority   = 103
        name       = "Rule 3"
        action     = "Allow"
      },
      {
        ip_address = "198.203.174.0/23"
        priority   = 104
        name       = "Rule 4"
        action     = "Allow"
      },
      {
        ip_address = "198.203.176.0/22"
        priority   = 105
        name       = "Rule 5"
        action     = "Allow"
      },
      {
        ip_address = "198.203.180.0/23"
        priority   = 106
        name       = "Rule 6"
        action     = "Allow"
      },
      {
        virtual_network_subnet_id = module.subnet_dbw_public_01.output.id
        priority                  = 107
        name                      = "Rule 7"
        action                    = "Allow"
      },
      {
        virtual_network_subnet_id = module.subnet_dbw_private_01.output.id
        priority                  = 108
        name                      = "Rule 8"
        action                    = "Allow"
      },
      {
        virtual_network_subnet_id = module.subnet_storage_01.output.id
        priority                  = 109
        name                      = "Rule 9"
        action                    = "Allow"
      }
    ]
  }
}
