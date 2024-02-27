data "azurerm_virtual_network" "hub_vnet" {
  name                = var.hub_vnet_name
  resource_group_name = var.hub_resource_group_name
}

resource "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.spoke_vnet_address_spaces

  tags = var.spoke_vnet_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_subnet" "subnet_aks" {
  name                 = var.subnet_aks_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = var.subnet_aks_address_prefixes

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_subnet" "subnet_private_endpoints" {
  name                 = var.subnet_private_endpoints_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = var.subnet_private_endpoints_address_prefixes

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_virtual_network_peering" "hub_to_spoke_peering" {
  name                         = var.hub_to_spoke_peering_name
  resource_group_name          = data.azurerm_virtual_network.hub_vnet.resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke_vnet.id
  allow_forwarded_traffic      = var.allow_forwarded_traffic_hub_to_spoke
  allow_gateway_transit        = var.allow_gateway_transit_hub_to_spoke
  allow_virtual_network_access = var.allow_virtual_network_access_hub_to_spoke
  use_remote_gateways          = var.use_remote_gateways_hub_to_spoke

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_virtual_network_peering" "spoke_to_hub_peering" {
  name                         = var.spoke_to_hub_peering_name
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.hub_vnet.id
  allow_forwarded_traffic      = var.allow_forwarded_traffic_spoke_to_hub
  allow_gateway_transit        = var.allow_gateway_transit_spoke_to_hub
  allow_virtual_network_access = var.allow_virtual_network_access_spoke_to_hub
  use_remote_gateways          = var.use_remote_gateways_spoke_to_hub

  lifecycle {
    prevent_destroy = true
  }
}