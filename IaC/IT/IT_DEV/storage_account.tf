resource "azurerm_storage_account" "storage_account" {
  name                          = var.storage_account_name
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  account_tier                  = var.storage_account_tier
  account_replication_type      = var.storage_account_replication_type
  account_kind                  = var.storage_account_kind
  access_tier                   = var.storage_account_access_tier
  public_network_access_enabled = var.storage_account_public_network_access_enabled
  enable_https_traffic_only     = var.storage_account_enable_https_traffic_only
  min_tls_version               = var.storage_account_min_tls_version

  tags = var.storage_account_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}