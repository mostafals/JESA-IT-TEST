resource "azurerm_public_ip" "aks_lb_public_ip" {
  name                = var.aks_lb_public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.aks_lb_public_ip_sku
  allocation_method   = var.aks_lb_public_ip_allocation_method

  tags = var.aks_lb_public_ip_tags

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}