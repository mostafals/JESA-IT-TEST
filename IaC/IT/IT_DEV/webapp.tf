resource "azurerm_service_plan" "webapp_service_plan" {
  name                = var.webapp_service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.webapp_service_sku
  os_type             = var.webapp_service_os

  tags = var.webapp_service_plan_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webapp_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.webapp_service_plan.id
  enabled             = var.webapp_enabled
  https_only          = var.webapp_https_only

  site_config {
    application_stack {
      node_version = var.webapp_node_version
    }
  }

  tags = var.webapp_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_linux_web_app_slot" "webapp_dev_slot" {
  name           = var.webapp_dev_slot_name
  app_service_id = azurerm_linux_web_app.webapp.id

  site_config {
    application_stack {
      node_version = var.webapp_node_version
    }
  }

  tags = var.webapp_dev_slot_tags

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}