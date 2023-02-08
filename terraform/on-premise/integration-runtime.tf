# Example Windows 16 server
resource "optumvm_windowsvm" "integration_runtime_01" {
  apptag            = "None"
  askid             = "AIDE_0075914"
  sharedaccessgroup = "AZU_DSI_GHEC"
  cpu               = "8"
  datacenter        = "mn053"
  image             = "v8-w2019"
  networkzone       = "CORE"
  secondarywinid    = "jgrif112"
  privuserwingroup  = "DSI_Cloud_Admin_Priv"
  memory            = "32"
  reason            = "Azure Integration Runtime"
  requestedfor      = "jgrif106"
  targetenv         = "DEV"
  availabilityzone  = "azb"
  interfacezone     = "INTERNAL"
  drcode            = "NO-DR"
  disk1sizegb       = "50"
  disk1driveltr     = "E"
  chefrunlist       = ""
  vraenv            = "PROD" # Should always be PROD for normal uses
}
