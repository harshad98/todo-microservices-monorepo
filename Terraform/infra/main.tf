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

  private_endpoint_subnet_name = var.private_endpoint_subnet_name

  private_endpoint_subnet_prefixes = var.private_endpoint_subnet_prefixes
}

##############################
# Azure Container Registry
##############################


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
  # acr_id    = module.acr.id

  tags = var.tags
}

##############################
# postgres
##############################
module "postgres" {

  source = "./modules/postgres"

  resource_group_name = module.resource_group.name

  location = module.resource_group.location

  postgres_server_name = var.postgres_server_name

  postgres_database_name = var.postgres_database_name

  postgres_admin_username = var.postgres_admin_username

  postgres_admin_password = var.postgres_admin_password

  postgres_version = var.postgres_version

  postgres_sku_name = var.postgres_sku_name

  postgres_storage_mb = var.postgres_storage_mb

  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id

  vnet_id = module.network.vnet_id

}