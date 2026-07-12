resource "azurerm_postgresql_flexible_server" "this" {

  name                = var.postgres_server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_admin_password

  version = var.postgres_version

  sku_name   = var.postgres_sku_name

  storage_mb = var.postgres_storage_mb

  zone = "1"

  backup_retention_days = 7

  public_network_access_enabled = false

}
#create a database
resource "azurerm_postgresql_flexible_server_database" "this" {

  name      = var.postgres_database_name

  server_id = azurerm_postgresql_flexible_server.this.id

  charset   = "UTF8"

  collation = "en_US.utf8"

}

#firewall rules
# resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {

#   name = "AllowAzure"

#   server_id = azurerm_postgresql_flexible_server.this.id

#   start_ip_address = "0.0.0.0"

#   end_ip_address   = "0.0.0.0"

# }

#private dns zone for postgres hostname
resource "azurerm_private_dns_zone" "postgres" {

  name = "privatelink.postgres.database.azure.com"

  resource_group_name = var.resource_group_name
}

#link private dns zone with Vnet
resource "azurerm_private_dns_zone_virtual_network_link" "postgres" {

  name = "postgres-link"

  resource_group_name = var.resource_group_name

  private_dns_zone_name = azurerm_private_dns_zone.postgres.name

  virtual_network_id = var.vnet_id

}

#create a private endpoint
resource "azurerm_private_endpoint" "postgres" {

  name = "postgres-private-endpoint"

  location = var.location

  resource_group_name = var.resource_group_name

  subnet_id = var.private_endpoint_subnet_id

  private_service_connection {

    name = "postgres-connection"

    private_connection_resource_id = azurerm_postgresql_flexible_server.this.id

    subresource_names = ["postgresqlServer"]

    is_manual_connection = false
  }

  private_dns_zone_group {

    name = "default"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.postgres.id
    ]
  }

}