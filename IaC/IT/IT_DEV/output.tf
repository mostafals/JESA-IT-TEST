/*
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_cluster_load_balancer_public_ip" {
  value = azurerm_kubernetes_cluster.aks.network_profile.0.load_balancer_profile.0.effective_outbound_ips
}
*/