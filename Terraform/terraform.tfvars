##############################
# Azure Authentication
##############################

subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

##############################
# Resource Group
##############################

resource_group_name = "todo-rg"

location = "Central India"

##############################
# Virtual Network
##############################

vnet_name = "todo-vnet"

vnet_address_space = [
  "10.0.0.0/16"
]

##############################
# AKS Subnet
##############################

aks_subnet_name = "aks-subnet"

aks_subnet_prefixes = [
  "10.0.1.0/24"
]

##############################
# Azure Container Registry
##############################

acr_name = "todoregistry12345"

acr_sku = "Basic"

##############################
# AKS Cluster
##############################

aks_cluster_name = "todo-aks"

dns_prefix = "todoaks"

node_count = 2

vm_size = "Standard_B2s"

##############################
# Tags
##############################

tags = {
  Environment = "Development"
  Project     = "Todo-Microservices"
  ManagedBy   = "Terraform"
}