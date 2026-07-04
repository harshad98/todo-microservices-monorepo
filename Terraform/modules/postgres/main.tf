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

  public_network_access_enabled = true

}
#create a database
resource "azurerm_postgresql_flexible_server_database" "this" {

  name      = var.postgres_database_name

  server_id = azurerm_postgresql_flexible_server.this.id

  charset   = "UTF8"

  collation = "en_US.utf8"

}

#firewall rules
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {

  name = "AllowAzure"

  server_id = azurerm_postgresql_flexible_server.this.id

  start_ip_address = "0.0.0.0"

  end_ip_address   = "0.0.0.0"

}
