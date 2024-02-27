locals {
  aks_cluster_active_directory = {
    azure_rbac_enabled = true
    azure_rbac_managed = true
  }

  aks_cluster_network_profile = {
    network_plugin = "azure"
    network_mode   = "transparent"
    network_policy = "azure"
    outbound_type  = "loadBalancer"
  }
}

locals {
  aks_acr_role_assignment = {
    role_definition_name = "AcrPull"
  }
  skip_service_principal_aad_check = true
}

data "azurerm_container_registry" "acr" {
  resource_group_name = var.acr_resource_group_name
  name                = var.acr_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                         = var.aks_cluster_name
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  node_resource_group          = var.aks_cluster_node_resource_group
  sku_tier                     = var.aks_cluster_sku_tier
  kubernetes_version           = var.aks_cluster_k8s_version
  dns_prefix                   = var.aks_cluster_dns_prefix
  local_account_disabled       = var.aks_cluster_local_account_disabled
  azure_policy_enabled         = var.aks_cluster_azure_policy_enabled
  image_cleaner_enabled        = var.aks_cluster_image_cleaner_enabled
  image_cleaner_interval_hours = var.aks_cluster_image_cleaner_interval_hours

  default_node_pool {
    name                  = var.aks_cluster_system_node_pool_name
    enable_auto_scaling   = var.aks_cluster_system_node_pool_auto_scaling_enabled
    node_count            = var.aks_cluster_system_node_pool_node_count
    min_count             = var.aks_cluster_system_node_pool_node_min_count
    max_count             = var.aks_cluster_system_node_pool_node_max_count
    vm_size               = var.aks_cluster_system_node_pool_node_vm_size
    os_disk_type          = var.aks_cluster_node_os_disk_type
    os_sku                = var.aks_cluster_node_os_sku
    os_disk_size_gb       = var.aks_cluster_system_node_pool_os_disk_size_gb
    enable_node_public_ip = var.aks_cluster_system_node_pool_enable_node_public_ip
    vnet_subnet_id        = azurerm_subnet.subnet_aks.id

    upgrade_settings {
      max_surge = var.aks_cluster_system_node_pool_max_surge
    }
  }

  azure_active_directory_role_based_access_control {
    managed            = local.aks_cluster_active_directory.azure_rbac_managed
    azure_rbac_enabled = local.aks_cluster_active_directory.azure_rbac_enabled
  }

  network_profile {
    network_plugin    = local.aks_cluster_network_profile.network_plugin
    network_mode      = local.aks_cluster_network_profile.network_mode
    network_policy    = local.aks_cluster_network_profile.network_policy
    outbound_type     = local.aks_cluster_network_profile.outbound_type
    load_balancer_sku = var.aks_cluster_load_balancer_sku
    load_balancer_profile {
      outbound_ip_address_ids = [azurerm_public_ip.aks_lb_public_ip.id]
    }
  }

  identity {
    type = var.aks_cluster_identity_type
  }

  tags = var.aks_cluster_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_user_node_pool" {
  name                  = var.aks_cluster_user_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  orchestrator_version  = var.aks_cluster_k8s_version
  enable_auto_scaling   = var.aks_cluster_user_node_pool_auto_scaling_enabled
  node_count            = var.aks_cluster_user_node_pool_node_count
  min_count             = var.aks_cluster_user_node_pool_node_min_count
  max_count             = var.aks_cluster_user_node_pool_node_max_count
  vm_size               = var.aks_cluster_user_node_pool_node_vm_size
  os_disk_type          = var.aks_cluster_node_os_disk_type
  os_sku                = var.aks_cluster_node_os_sku
  os_disk_size_gb       = var.aks_cluster_user_node_pool_os_disk_size_gb
  enable_node_public_ip = var.aks_cluster_user_node_pool_enable_node_public_ip
  vnet_subnet_id        = azurerm_subnet.subnet_aks.id

  upgrade_settings {
    max_surge = var.aks_cluster_user_node_pool_max_surge
  }

  tags = var.aks_cluster_tags

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
      node_count,
    ]
  }
}

resource "azurerm_role_assignment" "aks_acr_role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = local.aks_acr_role_assignment.role_definition_name
  scope                            = data.azurerm_container_registry.acr.id
  skip_service_principal_aad_check = local.skip_service_principal_aad_check
}