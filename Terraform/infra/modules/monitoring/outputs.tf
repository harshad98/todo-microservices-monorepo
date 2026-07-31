output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.this.id
}

output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.this.name
}

output "monitor_workspace_id" {
  value = azurerm_monitor_workspace.this.id
}


output "grafana_id" {
  value = azurerm_dashboard_grafana.this.id
}

output "grafana_endpoint" {
  value = azurerm_dashboard_grafana.this.endpoint
}

output "action_group_id" {
  value = azurerm_monitor_action_group.email.id
}