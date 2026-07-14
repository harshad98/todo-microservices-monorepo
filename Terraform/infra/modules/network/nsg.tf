resource "azurerm_network_security_group" "aks" {

  name                = "${var.aks_subnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

#rule 1= allow vnet traffic
resource "azurerm_network_security_rule" "allow_vnet" {

  name                        = "Allow-VNet"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"

  source_port_range           = "*"
  destination_port_range      = "*"

  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.aks.name
}

#rule 2= allow load balancer traffic
resource "azurerm_network_security_rule" "allow_lb" {

  name                        = "Allow-AzureLoadBalancer"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"

  source_port_range           = "*"
  destination_port_range      = "*"

  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.aks.name
}

#Rule 3 Allow HTTP
resource "azurerm_network_security_rule" "allow_http" {

  name                        = "Allow-HTTP"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "80"

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.aks.name
}

#Rule 4 Allow HTTPS
resource "azurerm_network_security_rule" "allow_https" {

  name                        = "Allow-HTTPS"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "443"

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.aks.name
}

#Rule 5 Allow Internet Outbound
resource "azurerm_network_security_rule" "allow_outbound" {

  name                        = "Allow-Internet-Outbound"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"

  source_port_range           = "*"
  destination_port_range      = "*"

  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.aks.name
}

#associate nsg with aks subnet
resource "azurerm_subnet_network_security_group_association" "aks" {

  subnet_id                 = azurerm_subnet.aks.id
  network_security_group_id = azurerm_network_security_group.aks.id
}
