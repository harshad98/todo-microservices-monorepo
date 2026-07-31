############################################
# Log Analytics Workspace
# Used by Container Insights / container logs
############################################

resource "azurerm_log_analytics_workspace" "this" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = var.tags
}


############################################
# Azure Monitor Workspace
# Used by Managed Prometheus
############################################

resource "azurerm_monitor_workspace" "this" {
  name                = var.monitor_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}


############################################
# Azure Managed Grafana
############################################

resource "azurerm_dashboard_grafana" "this" {
  name                = var.grafana_name
  location            = var.location
  resource_group_name = var.resource_group_name

  grafana_major_version = 12
  api_key_enabled = true

  identity {
    type = "SystemAssigned"
  }
#enable azure monitor workspace integration

  azure_monitor_workspace_integrations {
    resource_id = azurerm_monitor_workspace.this.id
  }

  tags = var.tags
}


############################################
# Grafana Permission
#
# Allows Grafana to read metrics
# from Azure Monitor Workspace
############################################

resource "azurerm_role_assignment" "grafana_monitoring_reader" {
  scope                = azurerm_monitor_workspace.this.id
  role_definition_name = "Monitoring Data Reader"
  principal_id         = azurerm_dashboard_grafana.this.identity[0].principal_id
}
############################################
# Grafana Permission
#
# Allows Grafana to read from 
#complete resource group
############################################

resource "azurerm_role_assignment" "grafana_reader" {

  scope = var.resource_group_id

  role_definition_name = "Reader"

  principal_id = azurerm_dashboard_grafana.this.identity[0].principal_id
}

############################################
# new role assignment for grafana RBAC
############################################

resource "azurerm_role_assignment" "grafana_admin" {

  scope = azurerm_dashboard_grafana.this.id

  role_definition_name = "Grafana Admin"

  principal_id = var.grafana_admin_object_id
}
