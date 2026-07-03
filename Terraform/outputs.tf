##############################
# Resource Group
##############################

output "resource_group_name" {
  description = "Azure Resource Group Name"
  value       = module.resource_group.name
}

output "resource_group_location" {
  description = "Azure Resource Group Location"
  value       = module.resource_group.location
}

##############################
# Network
##############################

output "vnet_name" {
  description = "Virtual Network Name"
  value       = module.network.vnet_name
}

output "subnet_name" {
  description = "AKS Subnet Name"
  value       = module.network.subnet_name
}

output "subnet_id" {
  description = "AKS Subnet ID"
  value       = module.network.subnet_id
}

##############################
# Azure Container Registry
##############################

output "acr_name" {
  description = "Azure Container Registry Name"
  value       = module.acr.name
}

output "acr_login_server" {
  description = "Azure Container Registry Login Server"
  value       = module.acr.login_server
}

##############################
# AKS Cluster
##############################

output "aks_cluster_name" {
  description = "AKS Cluster Name"
  value       = module.aks.name
}

output "aks_cluster_id" {
  description = "AKS Cluster ID"
  value       = module.aks.id
}

output "kube_config" {
  description = "Raw kubeconfig for AKS"
  value       = module.aks.kube_config
  sensitive   = true
}
