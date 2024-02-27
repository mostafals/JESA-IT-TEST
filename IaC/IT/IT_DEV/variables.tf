# /////////////////////////////////////////////////////////////////////////////
# Variables related to the resource group

variable "rg_name" {
  type        = string
  description = "The name of the IT department Dev Environment's resource group."
}

variable "global_location" {
  type        = string
  description = "The Azure region where the resources of IT department Dev Environment will be created."
}

variable "rg_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the IT department Dev Environment's resource group."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the resource group level management lock

variable "rg_lock_name" {
  type        = string
  description = "The name of the resource group level management lock."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the hub virtual network

variable "hub_resource_group_name" {
  type        = string
  description = "The name of the resource group where the hub virtual network has been created."
}

variable "hub_vnet_name" {
  type        = string
  description = "The name of the hub virtual network that has been created."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the spoke virtual network

variable "spoke_vnet_name" {
  type        = string
  description = "The name of the IT department Dev Environment's virtual network."
}

variable "spoke_vnet_address_spaces" {
  type        = list(string)
  description = "The address spaces that will be used for the IT department Dev Environment's virtual network."
}

variable "spoke_vnet_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the IT department Dev Environment's virtual network."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the spoke subnet containing the AKS cluster

variable "subnet_aks_name" {
  type        = string
  description = "The name of the subnet where the AKS cluster resources will be deployed."
}

variable "subnet_aks_address_prefixes" {
  type        = list(string)
  description = "The address prefixes that will be used for the subnet containing the AKS cluster."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the spoke subnet containing the private endpoints

variable "subnet_private_endpoints_name" {
  type        = string
  description = "The name of the subnet where the private endpoints will be deployed."
}

variable "subnet_private_endpoints_address_prefixes" {
  type        = list(string)
  description = "The address prefixes that will be used for the subnet containing the private endpoints."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the spoke-to-hub virtual network peering

variable "spoke_to_hub_peering_name" {
  type        = string
  description = "The name of the peering from the spoke to the hub virtual network."
}

variable "allow_forwarded_traffic_spoke_to_hub" {
  type        = string
  description = "Indicating whether forwarded traffic from the spoke to the hub virtual network is allowed."
}

variable "allow_gateway_transit_spoke_to_hub" {
  type        = string
  description = "Indicating whether gateway transit from the spoke to the hub virtual network is allowed."
}

variable "allow_virtual_network_access_spoke_to_hub" {
  type        = string
  description = "Indicating whether virtual network access from the spoke to the hub virtual network is allowed."
}

variable "use_remote_gateways_spoke_to_hub" {
  type        = string
  description = "Indicating whether the remote gateways will be used for the spoke-to-hub virtual network peering."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the hub-to-spoke virtual network peering

variable "hub_to_spoke_peering_name" {
  type        = string
  description = "The name of the peering from the hub to the spoke virtual network."
}

variable "allow_forwarded_traffic_hub_to_spoke" {
  type        = string
  description = "Indicating whether forwarded traffic from the hub to the spoke virtual network is allowed."
}

variable "allow_gateway_transit_hub_to_spoke" {
  type        = string
  description = "Indicating whether gateway transit from the hub to the spoke virtual network is allowed."
}

variable "allow_virtual_network_access_hub_to_spoke" {
  type        = string
  description = "Indicating whether virtual network access from the hub to the spoke virtual network is allowed."
}

variable "use_remote_gateways_hub_to_spoke" {
  type        = string
  description = "Indicating whether the remote gateways will be used for the hub-to-spoke virtual network peering."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the Azure Kubernetes Cluster

variable "aks_cluster_name" {
  type        = string
  description = "The name of the AKS cluster."
}

variable "aks_cluster_node_resource_group" {
  type        = string
  description = "The name of the resource group where the nodes of the AKS cluster will be created."
}

variable "aks_cluster_sku_tier" {
  type        = string
  description = "The tier of the AKS cluster."
}

variable "aks_cluster_k8s_version" {
  type        = string
  description = "The version of Kubernetes that will be used for the AKS cluster."
}

variable "aks_cluster_dns_prefix" {
  type        = string
  description = "The DNS prefix that will be used for the AKS cluster."
}

variable "aks_cluster_local_account_disabled" {
  type        = bool
  description = "Indicates whether the local account will be disabled for the AKS cluster."
}

variable "aks_cluster_azure_policy_enabled" {
  type        = bool
  description = "Indicates whether Azure Policy will be enabled for the AKS cluster."
}

variable "aks_cluster_image_cleaner_enabled" {
  type        = bool
  description = "Indicates whether the image cleaner will be enabled for the AKS cluster."
}

variable "aks_cluster_image_cleaner_interval_hours" {
  type        = number
  description = "The interval in hours for the image cleaner of the AKS cluster."
}

variable "aks_cluster_system_node_pool_name" {
  type        = string
  description = "The name of the system node pool for the AKS cluster."
}

variable "aks_cluster_system_node_pool_auto_scaling_enabled" {
  type        = bool
  description = "Indicates whether auto scaling will be enabled for the system node pool of the AKS cluster."
}

variable "aks_cluster_system_node_pool_node_count" {
  type        = number
  description = "The number of nodes for the system node pool of the AKS cluster."
}

variable "aks_cluster_system_node_pool_node_min_count" {
  type        = number
  description = "The minimum number of nodes for the system node pool of the AKS cluster."
}

variable "aks_cluster_system_node_pool_node_max_count" {
  type        = number
  description = "The maximum number of nodes for the system node pool of the AKS cluster."
}

variable "aks_cluster_system_node_pool_node_vm_size" {
  type        = string
  description = "The VM size for the nodes of the system node pool of the AKS cluster."
}

variable "aks_cluster_system_node_pool_os_disk_size_gb" {
  type        = number
  description = "The OS disk size in GB for the system node pool of the AKS cluster."
}

variable "aks_cluster_system_node_pool_enable_node_public_ip" {
  type        = bool
  description = "Indicates whether public IP addresses will be enabled for the nodes of the system node pool of the AKS cluster."
}

variable "aks_cluster_system_node_pool_max_surge" {
  type        = number
  description = "The maximum number or percentage of nodes which will be added to the system node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_name" {
  type        = string
  description = "The name of the user node pool for the AKS cluster."
}

variable "aks_cluster_user_node_pool_auto_scaling_enabled" {
  type        = bool
  description = "Indicates whether auto scaling will be enabled for the user node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_node_count" {
  type        = number
  description = "The number of nodes for the user node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_node_min_count" {
  type        = number
  description = "The minimum number of nodes for the user node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_node_max_count" {
  type        = number
  description = "The maximum number of nodes for the user node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_node_vm_size" {
  type        = string
  description = "The VM size for the nodes of the user node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_os_disk_size_gb" {
  type        = number
  description = "The OS disk size in GB for the user node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_enable_node_public_ip" {
  type        = bool
  description = "Indicates whether public IP addresses will be enabled for the nodes of the user node pool of the AKS cluster."
}

variable "aks_cluster_user_node_pool_max_surge" {
  type        = number
  description = "The maximum number or percentage of nodes which will be added to the user node pool of the AKS cluster."
}

variable "aks_cluster_node_os_disk_type" {
  type        = string
  description = "The OS disk type for the nodes of the AKS cluster."
}

variable "aks_cluster_node_os_sku" {
  type        = string
  description = "The OS SKU for the nodes of the AKS cluster."
}

variable "aks_cluster_load_balancer_sku" {
  type        = string
  description = "The SKU of the load balancer for the AKS cluster."
}

variable "aks_cluster_identity_type" {
  type        = string
  description = "The identity type for the AKS cluster."
}

variable "aks_cluster_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the AKS cluster."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the AKS cluster load balancer public IP address

variable "aks_lb_public_ip_name" {
  type        = string
  description = "The name of the public IP address assigned to the AKS cluster load balancer."
}

variable "aks_lb_public_ip_sku" {
  type        = string
  description = "The SKU of the public IP address assigned to the AKS cluster load balancer."
}

variable "aks_lb_public_ip_allocation_method" {
  type        = string
  description = "The allocation method of the public IP address assigned to the AKS cluster load balancer."
}

variable "aks_lb_public_ip_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the public IP address assigned to the AKS cluster load balancer."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the Azure Container Registry

variable "acr_resource_group_name" {
  type        = string
  description = "The name of the resource group where the Azure Container Registry has been created."
}

variable "acr_name" {
  type        = string
  description = "The name of the Azure Container Registry."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the Cosmos DB account

variable "cosmos_db_account_name" {
  type        = string
  description = "The name of the Cosmos DB account."
}

variable "cosmos_db_account_offer_type" {
  type        = string
  description = "The offer type of the Cosmos DB account."
}

variable "cosmos_db_account_kind" {
  type        = string
  description = "The kind of the Cosmos DB account."
}

variable "cosmos_db_account_enable_free_tier" {
  type        = bool
  description = "Indicates whether the free tier will be enabled for the Cosmos DB account."
}

variable "cosmos_db_account_enable_automatic_failover" {
  type        = bool
  description = "Indicates whether automatic failover will be enabled for the Cosmos DB account."
}

variable "cosmos_db_account_public_network_access_enabled" {
  type        = bool
  description = "Indicates whether public network access is allowed for the Cosmos DB account."
}

variable "cosmos_db_account_mongo_server_version" {
  type        = string
  description = "The version of the MongoDB server that will be used for the Cosmos DB account."
}

variable "cosmos_db_account_capacity_total_throughput_limit" {
  type        = number
  description = "The total throughput limit for the Cosmos DB account."
}

variable "cosmos_db_account_zone_redundant" {
  type        = bool
  description = "Indicates whether zone redundancy will be enabled for the Cosmos DB account."
}

variable "cosmos_db_account_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the Cosmos DB account."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the private endpoint for the Cosmos DB account

variable "cosmosdb_account_private_endpoint_name" {
  type        = string
  description = "The name of the private endpoint for the Cosmos DB account."
}

variable "private_service_connection_cosmosdb_account_name" {
  type        = string
  description = "The name of the private service connection for the Cosmos DB account."
}

variable "cosmosdb_account_private_endpoint_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the private endpoint for the Cosmos DB account."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to Web App

variable "webapp_service_plan_name" {
  type        = string
  description = "The name of the service plan for the web app."
}

variable "webapp_service_sku" {
  type        = string
  description = "The SKU of the service plan for the web app."
}

variable "webapp_service_os" {
  type        = string
  description = "The operating system of the service plan for the web app."
}

variable "webapp_service_plan_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the service plan for the web app."
}

variable "webapp_name" {
  type        = string
  description = "The name of the web app."
}

variable "webapp_enabled" {
  type        = bool
  description = "Indicates whether the web app is enabled."
}

variable "webapp_https_only" {
  type        = bool
  description = "Indicates whether the web app is only accessible via HTTPS."
}

variable "webapp_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the web app."
}

variable "webapp_dev_slot_name" {
  type        = string
  description = "The name of the development slot for the web app."
}

variable "webapp_dev_slot_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the development slot for the web app."
}

variable "webapp_node_version" {
  type        = string
  description = "The version of Node.js that will be used for the web app."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the storage account

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account."
}

variable "storage_account_tier" {
  type        = string
  description = "The tier of the storage account."
}

variable "storage_account_replication_type" {
  type        = string
  description = "The replication type of the storage account."
}

variable "storage_account_kind" {
  type        = string
  description = "The kind of the storage account."
}

variable "storage_account_access_tier" {
  type        = string
  description = "The access tier of the storage account."
}

variable "storage_account_public_network_access_enabled" {
  type        = bool
  description = "Indicates whether public network access is allowed for the storage account."
}

variable "storage_account_enable_https_traffic_only" {
  type        = bool
  description = "Indicates whether HTTPS traffic only is allowed for the storage account."
}

variable "storage_account_min_tls_version" {
  type        = string
  description = "The minimum TLS version to be permitted on requests to the storage account."
}

variable "storage_account_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the storage account."
}

# /////////////////////////////////////////////////////////////////////////////
# Variables related to the Redis Cache

variable "redis_cache_name" {
  type        = string
  description = "The name of the Redis Cache."
}

variable "redis_cache_redis_version" {
  type        = string
  description = "The version of Redis that will be used for the Redis Cache."
}

variable "redis_cache_sku_name" {
  type        = string
  description = "The SKU of the Redis Cache."
}

variable "redis_cache_capacity" {
  type        = number
  description = "The capacity of the Redis Cache."
}

variable "redis_cache_family" {
  type        = string
  description = "The family of the Redis Cache."
}

variable "redis_cache_minimum_tls_version" {
  type        = string
  description = "The minimum TLS version to be permitted on requests to the Redis Cache."
}

variable "redis_cache_public_network_access_enabled" {
  type        = bool
  description = "Indicates whether public network access is allowed for the Redis Cache."
}

variable "redis_cache_active_directory_authentication_enabled" {
  type        = bool
  description = "Indicates whether Active Directory authentication will be enabled for the Redis Cache."
}

variable "redis_cache_tags" {
  type        = map(string)
  description = "The tags that will be assigned to the Redis Cache."
}