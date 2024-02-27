rg_name         = "rg-it-dev-euw-dev"
global_location = "westeurope"
rg_tags         = { Environment = "Dev", Department = "IT" }

rg_lock_name = "lock-rg-it-dev-euw-dev"


hub_resource_group_name = "rg-netw-glob-euw-dev"
hub_vnet_name           = "vnet-s2s-aks-glob-euw-dev-01"

spoke_vnet_name           = "vnet-aks-it-dev-euw-dev-01"
spoke_vnet_address_spaces = ["10.11.0.0/16"]
spoke_vnet_tags           = { Environment = "Dev", Department = "IT" }

subnet_aks_name             = "subnetaks"
subnet_aks_address_prefixes = ["10.11.0.0/17"]

subnet_private_endpoints_name             = "subnetpep"
subnet_private_endpoints_address_prefixes = ["10.11.128.0/24"]

hub_to_spoke_peering_name                 = "peer-itdev-glob-euw-01-dev"
allow_forwarded_traffic_hub_to_spoke      = false
allow_gateway_transit_hub_to_spoke        = true
allow_virtual_network_access_hub_to_spoke = true
use_remote_gateways_hub_to_spoke          = false

spoke_to_hub_peering_name                 = "peer-it-dev-euw-01-dev"
allow_forwarded_traffic_spoke_to_hub      = true
allow_gateway_transit_spoke_to_hub        = false
allow_virtual_network_access_spoke_to_hub = true
use_remote_gateways_spoke_to_hub          = true


aks_cluster_name                         = "aks-it-dev-euw-dev-01"
aks_cluster_node_resource_group          = "MC_rg-it-dev-euw-dev_aks-it-dev-euw-dev-01_westeurope"
aks_cluster_sku_tier                     = "Free"
aks_cluster_k8s_version                  = "1.28.3"
aks_cluster_dns_prefix                   = "aksitdeveuwdev01"
aks_cluster_local_account_disabled       = true
aks_cluster_azure_policy_enabled         = true
aks_cluster_image_cleaner_enabled        = true
aks_cluster_image_cleaner_interval_hours = 24
aks_cluster_tags                         = { Environment = "Dev", Department = "IT" }

aks_cluster_system_node_pool_name                  = "systempool"
aks_cluster_system_node_pool_auto_scaling_enabled  = false
aks_cluster_system_node_pool_node_count            = 1
aks_cluster_system_node_pool_node_min_count        = null
aks_cluster_system_node_pool_node_max_count        = null
aks_cluster_system_node_pool_node_vm_size          = "standard_B2s"
aks_cluster_system_node_pool_os_disk_size_gb       = 120
aks_cluster_system_node_pool_enable_node_public_ip = false
aks_cluster_system_node_pool_max_surge             = 1

aks_cluster_user_node_pool_name                  = "userpool"
aks_cluster_user_node_pool_auto_scaling_enabled  = true
aks_cluster_user_node_pool_node_count            = 2
aks_cluster_user_node_pool_node_min_count        = 1
aks_cluster_user_node_pool_node_max_count        = 2
aks_cluster_user_node_pool_node_vm_size          = "standard_B4ms"
aks_cluster_user_node_pool_os_disk_size_gb       = 80
aks_cluster_user_node_pool_enable_node_public_ip = false
aks_cluster_user_node_pool_max_surge             = 2

aks_cluster_node_os_disk_type = "Managed"
aks_cluster_node_os_sku       = "CBLMariner"
aks_cluster_load_balancer_sku = "standard"
aks_cluster_identity_type     = "SystemAssigned"


aks_lb_public_ip_name              = "pip-aks-it-dev-euw-dev-01"
aks_lb_public_ip_sku               = "Standard"
aks_lb_public_ip_allocation_method = "Static"
aks_lb_public_ip_tags              = { Environment = "Dev", Department = "IT" }


acr_resource_group_name = "rg-it-glob-euw-dev"
acr_name                = "acritglobeuwdev01"


cosmos_db_account_name                            = "cosmos-it-dev-euw-dev-01"
cosmos_db_account_offer_type                      = "Standard"
cosmos_db_account_kind                            = "MongoDB"
cosmos_db_account_enable_free_tier                = true
cosmos_db_account_enable_automatic_failover       = true
cosmos_db_account_public_network_access_enabled   = false
cosmos_db_account_mongo_server_version            = "4.0"
cosmos_db_account_capacity_total_throughput_limit = 1000
cosmos_db_account_zone_redundant                  = false
cosmos_db_account_tags                            = { Environment = "Dev", Department = "IT" }

cosmosdb_account_private_endpoint_name           = "pep-cosmos-it-dev-euw-dev-01"
private_service_connection_cosmosdb_account_name = "privateservcosmosdbitdev01"
cosmosdb_account_private_endpoint_tags           = { Environment = "Dev", Department = "IT" }


webapp_service_plan_name = "asp-it-dev-euw-dev-01"
webapp_service_sku       = "S1"
webapp_service_os        = "Linux"
webapp_service_plan_tags = { Environment = "Dev", Department = "IT" }

webapp_name = "app-it-dev-euw-dev-01"
webapp_tags = { Environment = "Dev", Department = "IT" }

webapp_dev_slot_name = "dev"
webapp_dev_slot_tags = { Environment = "Dev", Department = "IT" }

webapp_node_version = "18-lts"
webapp_enabled      = true
webapp_https_only   = true


storage_account_name                          = "stitdeveuwdev01"
storage_account_tier                          = "Standard"
storage_account_replication_type              = "LRS"
storage_account_kind                          = "StorageV2"
storage_account_access_tier                   = "Hot"
storage_account_public_network_access_enabled = true
storage_account_enable_https_traffic_only     = true
storage_account_min_tls_version               = "TLS1_2"
storage_account_tags                          = { Environment = "Dev", Department = "IT" }


redis_cache_name                                    = "redis-it-dev-euw-dev-01"
redis_cache_redis_version                           = "6"
redis_cache_sku_name                                = "Basic"
redis_cache_capacity                                = 0
redis_cache_family                                  = "C"
redis_cache_minimum_tls_version                     = "1.2"
redis_cache_public_network_access_enabled           = true
redis_cache_active_directory_authentication_enabled = false
redis_cache_tags                                    = { Environment = "Dev", Department = "IT" }