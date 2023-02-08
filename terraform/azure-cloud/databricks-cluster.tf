data "databricks_spark_version" "spark_version_01" {
  depends_on        = [module.databricks_workspace_01]
  long_term_support = true
  ml                = true
}

data "databricks_spark_version" "spark_version_02" {
  depends_on        = [module.databricks_workspace_01]
  long_term_support = true
  photon            = true
  scala             = "2.12"
  spark_version     = "3.2.1"
}

data "databricks_spark_version" "spark_version_03" {
  depends_on        = [module.databricks_workspace_01]
  long_term_support = true
  ml                = true
}

module "databricks_cluster_01" {
  source                  = "git::https://github.com/uhg-internal/databricks_cluster.git?ref=v0.0.7"
  cluster_name            = "cluster-${var.team}-${var.environment}-${var.project}-01"
  spark_version           = data.databricks_spark_version.spark_version_01.id
  node_type_id            = "Standard_D4as_v5"
  driver_node_type_id     = "Standard_D4as_v5"
  autotermination_minutes = 20
  data_security_mode      = "LEGACY_PASSTHROUGH"

  autoscale = {
    min_workers = 2
    max_workers = 8
  }

  azure_attributes = {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}

module "databricks_cluster_02" {
  source                  = "git::https://github.com/uhg-internal/databricks_cluster.git?ref=v0.0.7"
  count                   = var.environment == "dev" ? 1 : 0
  cluster_name            = "cluster-${var.team}-${var.environment}-${var.project}-02"
  spark_version           = data.databricks_spark_version.spark_version_02.id
  node_type_id            = "Standard_D4as_v5"
  driver_node_type_id     = "Standard_D4as_v5"
  autotermination_minutes = 20
  data_security_mode      = "LEGACY_SINGLE_USER"

  autoscale = {
    min_workers = 2
    max_workers = 8
  }

  azure_attributes = {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}

module "databricks_cluster_03" {
  source                  = "git::https://github.com/uhg-internal/databricks_cluster.git?ref=v0.0.7"
  count                   = var.environment == "dev" ? 1 : 0
  cluster_name            = "cluster-${var.team}-${var.environment}-${var.project}-03"
  spark_version           = data.databricks_spark_version.spark_version_03.id
  node_type_id            = "Standard_D4as_v5"
  driver_node_type_id     = "Standard_D4as_v5"
  autotermination_minutes = 20


  autoscale = {
    min_workers = 2
    max_workers = 8
  }

  azure_attributes = {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}

module "databricks_cluster_04" {
  source                  = "git::https://github.com/uhg-internal/databricks_cluster.git?ref=v0.0.7"
  count                   = var.environment == "dev" ? 1 : 0
  cluster_name            = "cluster-${var.team}-${var.environment}-${var.project}-ModelValidatorJobs"
  spark_version           = data.databricks_spark_version.spark_version_01.id
  node_type_id            = "Standard_D4as_v5"
  driver_node_type_id     = "Standard_D4as_v5"
  autotermination_minutes = 20
  data_security_mode      = "LEGACY_PASSTHROUGH"

  autoscale = {
    min_workers = 2
    max_workers = 8
  }

  azure_attributes = {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}

module "databricks_cluster_05" {
  source                  = "git::https://github.com/uhg-internal/databricks_cluster.git?ref=v0.0.7"
  count                   = var.environment == "dev" ? 1 : 0
  cluster_name            = "cluster-${var.team}-${var.environment}-${var.project}-ModelValidatorsAutoML"
  spark_version           = data.databricks_spark_version.spark_version_03.id
  node_type_id            = "Standard_D4as_v5"
  driver_node_type_id     = "Standard_D4as_v5"
  autotermination_minutes = 20


  autoscale = {
    min_workers = 2
    max_workers = 8
  }

  azure_attributes = {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}

module "databricks_cluster_06" {
  source                  = "git::https://github.com/uhg-internal/databricks_cluster.git?ref=v0.0.7"
  count                   = var.environment == "dev" ? 1 : 0
  cluster_name            = "cluster-${var.team}-${var.environment}-${var.project}-ModelValidtors-R-01"
  spark_version           = data.databricks_spark_version.spark_version_02.id
  node_type_id            = "Standard_D4as_v5"
  driver_node_type_id     = "Standard_D4as_v5"
  autotermination_minutes = 20
  data_security_mode      = "LEGACY_SINGLE_USER"
  single_user_name        = "ideleon5@optumcloud.com"

  autoscale = {
    min_workers = 2
    max_workers = 8
  }

  azure_attributes = {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}

module "databricks_cluster_07" {
  source                  = "git::https://github.com/uhg-internal/databricks_cluster.git?ref=v0.0.7"
  count                   = var.environment == "dev" ? 1 : 0
  cluster_name            = "cluster-${var.team}-${var.environment}-${var.project}-ModelValidtors-R-02"
  spark_version           = data.databricks_spark_version.spark_version_02.id
  node_type_id            = "Standard_D4as_v5"
  driver_node_type_id     = "Standard_D4as_v5"
  autotermination_minutes = 20
  data_security_mode      = "LEGACY_SINGLE_USER"
  single_user_name        = "kgao2@optumcloud.com"

  autoscale = {
    min_workers = 2
    max_workers = 8
  }

  azure_attributes = {
    availability       = "SPOT_WITH_FALLBACK_AZURE"
    first_on_demand    = 1
    spot_bid_max_price = 100
  }
}
