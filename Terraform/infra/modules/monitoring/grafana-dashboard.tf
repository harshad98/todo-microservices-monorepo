resource "azurerm_dashboard_grafana_dashboard" "todo_dashboard" {

  grafana_id = azurerm_dashboard_grafana.this.id

  config_json = file("${path.module}/dashboard.json")
}