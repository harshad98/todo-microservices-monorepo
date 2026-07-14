output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.this.name
}

output "subnet_id" {
  description = "AKS Subnet ID"
  value       = azurerm_subnet.aks.id
}

output "subnet_name" {
  description = "AKS Subnet Name"
  value       = azurerm_subnet.aks.name
}

##############################
# private endpoint subnet
##############################
output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint.id
}

output "private_endpoint_subnet_name" {
  value = azurerm_subnet.private_endpoint.name
}

##############################
# NSG
##############################
output "aks_nsg_id" {
  value = azurerm_network_security_group.aks.id
}

output "aks_nsg_name" {
  value = azurerm_network_security_group.aks.name
}

output "private_endpoint_nsg_id" {
  value = azurerm_network_security_group.private_endpoint.id
}

output "private_endpoint_nsg_name" {
  value = azurerm_network_security_group.private_endpoint.name
}
