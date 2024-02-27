locals {
  resource_group_management_lock = {
    lock_level = "CanNotDelete"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.global_location

  tags = var.rg_tags

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_management_lock" "rg_lock" {
  name       = var.rg_lock_name
  scope      = azurerm_resource_group.rg.id
  lock_level = local.resource_group_management_lock.lock_level

  lifecycle {
    prevent_destroy = true
  }
}
