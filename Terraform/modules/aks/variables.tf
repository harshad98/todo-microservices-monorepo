variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "dns_prefix" {
  description = "DNS Prefix"
  type        = string
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
}

variable "vm_size" {
  description = "AKS VM Size"
  type        = string
}

variable "subnet_id" {
  description = "AKS Subnet ID"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry ID"
  type        = string
}

variable "tags" {
  description = "Common Tags"
  type        = map(string)
}
