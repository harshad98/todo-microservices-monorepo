#create a NSG
resource "azurerm_network_security_group" "private_endpoint" {

  name                = "${var.private_endpoint_subnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

#allow traffic from the Vnet
resource "azurerm_network_security_rule" "private_endpoint_allow_vnet" {

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
  network_security_group_name = azurerm_network_security_group.private_endpoint.name
}


#allow outbound to the Vnet
resource "azurerm_network_security_rule" "private_endpoint_outbound_vnet" {

  name                        = "Allow-Outbound-VNet"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"

  source_port_range           = "*"
  destination_port_range      = "*"

  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.private_endpoint.name
}

#associate the NSG with the subnet

resource "azurerm_subnet_network_security_group_association" "private_endpoint" {

  subnet_id                 = azurerm_subnet.private_endpoint.id
  network_security_group_id = azurerm_network_security_group.private_endpoint.id
}
