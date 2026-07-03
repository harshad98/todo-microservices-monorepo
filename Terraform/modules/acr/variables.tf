variable "acr_name" {
  description = "Azure Container Registry Name"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "acr_sku" {
  description = "Azure Container Registry SKU"
  type        = string
}

variable "tags" {
  description = "Common Tags"
  type        = map(string)
}
