##############################
# Resource Group
##############################

module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

##############################
# Network
##############################

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  vnet_name            = var.vnet_name
  vnet_address_space   = var.vnet_address_space
  aks_subnet_name      = var.aks_subnet_name
  aks_subnet_prefixes  = var.aks_subnet_prefixes

  tags = var.tags
}

##############################
# Azure Container Registry
##############################

module "acr" {
  source = "./modules/acr"

  acr_name            = var.acr_name
  acr_sku             = var.acr_sku
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  tags = var.tags
}

##############################
# AKS Cluster
##############################

module "aks" {
  source = "./modules/aks"

  aks_cluster_name    = var.aks_cluster_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  dns_prefix = var.dns_prefix
  node_count = var.node_count
  vm_size    = var.vm_size

  subnet_id = module.network.subnet_id
  acr_id    = module.acr.id

  tags = var.tags
}