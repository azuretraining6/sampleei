# Provider code block for OptumVM Provider versions 3 and higher
provider "optumvm" {
  username = var.PriMsId
  password = var.PriMsIdPwd
  host     = "https://infra-apis.optum.com"
  insecure = true
}

terraform {
  required_providers {
    optumvm = {
      source = "terraform-registry.optum.com/optum/optumvm"
    }
    optumnetwork = {
      source = "terraform-registry.optum.com/optum/optumnetwork"
    }
    optumsecure = {
      source = "terraform-registry.optum.com/optum/optumsecure"
    }
    optumstorage = {
      source = "terraform-registry.optum.com/optum/optumstorage"
    }
  }
}

