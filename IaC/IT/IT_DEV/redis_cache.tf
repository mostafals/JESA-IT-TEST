resource "azurerm_redis_cache" "redis_cache" {
  name                          = var.redis_cache_name
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  redis_version                 = var.redis_cache_redis_version
  sku_name                      = var.redis_cache_sku_name
  capacity                      = var.redis_cache_capacity
  family                        = var.redis_cache_family
  minimum_tls_version           = var.redis_cache_minimum_tls_version
  public_network_access_enabled = var.redis_cache_public_network_access_enabled

  redis_configuration {
    active_directory_authentication_enabled = var.redis_cache_active_directory_authentication_enabled
  }

  tags = var.redis_cache_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}