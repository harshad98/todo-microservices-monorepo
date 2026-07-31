provider "grafana" {

  url = azurerm_dashboard_grafana.this.endpoint

  auth = var.grafana_token 

}