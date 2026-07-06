##############################
# Azure Authentication
##############################

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

##############################
# Resource Group
##############################

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Central India"
}

##############################
# Virtual Network
##############################

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet Address Space"
  type        = list(string)

  default = [
    "10.0.0.0/16"
  ]
}

##############################
# AKS Subnet
##############################

variable "aks_subnet_name" {
  description = "AKS Subnet Name"
  type        = string
}

variable "aks_subnet_prefixes" {
  description = "AKS Subnet Address Prefixes"
  type        = list(string)

  default = [
    "10.0.1.0/24"
  ]
}

##############################
# Azure Container Registry
##############################



##############################
# AKS Cluster
##############################

variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  type        = string
}

variable "dns_prefix" {
  description = "DNS Prefix for AKS"
  type        = string
}

variable "node_count" {
  description = "Number of AKS Nodes"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "AKS Node VM Size"
  type        = string
  default     = "Standard_B2s"
}

##############################
# Tags
##############################

variable "tags" {
  description = "Common Tags"

  type = map(string)

  default = {
    Environment = "Development"
    Project     = "Todo-Microservices"
    ManagedBy   = "Terraform"
  }
}

##############################
# PostgreSQL
##############################

variable "postgres_server_name" {
  type = string
}

variable "postgres_database_name" {
  type = string
}

variable "postgres_admin_username" {
  type = string
}

variable "postgres_admin_password" {
  type      = string
  sensitive = true
}

variable "postgres_sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "postgres_storage_mb" {
  type    = number
  default = 5120
}

variable "postgres_version" {
  type    = string
  default = "16"
}

