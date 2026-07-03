variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
}

variable "aks_subnet_name" {
  description = "AKS Subnet Name"
  type        = string
}

variable "aks_subnet_prefixes" {
  description = "AKS Subnet Address Prefixes"
  type        = list(string)
}

variable "tags" {
  description = "Common Tags"
  type        = map(string)
}
