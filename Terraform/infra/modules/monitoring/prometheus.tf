resource "azurerm_monitor_data_collection_rule" "prometheus" {

  name                = "prometheus-dcr"
  location            = var.location
  resource_group_name = var.resource_group_name

  kind = "Linux"

  destinations {

    monitor_account {

      monitor_account_id = azurerm_monitor_workspace.this.id

      name = "MonitoringAccount1"
    }
  }

  data_flow {

    streams = [
      "Microsoft-PrometheusMetrics"
    ]

    destinations = [
      "MonitoringAccount1"
    ]
  }

  data_sources {

    prometheus_forwarder {

      streams = [
        "Microsoft-PrometheusMetrics"
      ]

      name = "PrometheusDataSource"
    }
  }

}

#associate DCR with AKS cluster
resource "azurerm_monitor_data_collection_rule_association" "aks" {

  name = "prometheus-association"

  target_resource_id = var.aks_cluster_id

  data_collection_rule_id = azurerm_monitor_data_collection_rule.prometheus.id
}