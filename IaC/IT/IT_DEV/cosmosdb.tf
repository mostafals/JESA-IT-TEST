locals {
  consistency_policy = {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  capabilities = {
    enable_mongo                = "EnableMongo"
    enable_aggregation_pipeline = "EnableAggregationPipeline"
  }

  identity = {
    type = "SystemAssigned"
  }
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                          = var.cosmos_db_account_name
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  offer_type                    = var.cosmos_db_account_offer_type
  kind                          = var.cosmos_db_account_kind
  mongo_server_version          = var.cosmos_db_account_mongo_server_version
  enable_free_tier              = var.cosmos_db_account_enable_free_tier
  enable_automatic_failover     = var.cosmos_db_account_enable_automatic_failover
  public_network_access_enabled = var.cosmos_db_account_public_network_access_enabled

  capabilities {
    name = local.capabilities.enable_mongo
  }

  capabilities {
    name = local.capabilities.enable_aggregation_pipeline
  }

  capacity {
    total_throughput_limit = var.cosmos_db_account_capacity_total_throughput_limit
  }

  consistency_policy {
    consistency_level       = local.consistency_policy.consistency_level
    max_interval_in_seconds = local.consistency_policy.max_interval_in_seconds
    max_staleness_prefix    = local.consistency_policy.max_staleness_prefix
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
    zone_redundant    = var.cosmos_db_account_zone_redundant
  }

  identity {
    type = local.identity.type
  }

  tags = var.cosmos_db_account_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_private_endpoint" "cosmosdb_account_private_endpoint" {
  name                = var.cosmosdb_account_private_endpoint_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet_private_endpoints.id

  private_service_connection {
    name                           = var.private_service_connection_cosmosdb_account_name
    is_manual_connection           = false
    private_connection_resource_id = azurerm_cosmosdb_account.cosmosdb_account.id
    subresource_names              = ["mongodb"]
  }

  tags = var.cosmosdb_account_private_endpoint_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}