resource "azurerm_monitor_alert_prometheus_rule_group" "alerts" {

  name                = "todo-prometheus-alerts"
  location            = var.location
  resource_group_name = var.resource_group_name

  scopes = [
    azurerm_monitor_workspace.this.id
  ]

  interval = "PT1M"


  ############################################
  # High Pod CPU
  ############################################

  rule {

    enabled = true

    alert = "HighPodCPU"

    expression = <<-EOT
      sum by (namespace, pod) (
        rate(container_cpu_usage_seconds_total{
          namespace="todo-app",
          container!="",
          container!="POD"
        }[5m])
      ) > 0.8
    EOT

    for = "PT5M"

    severity = 2

    action {
      action_group_id = azurerm_monitor_action_group.email.id
    }

    alert_resolution {
      auto_resolved   = true
      time_to_resolve = "PT10M"
    }

    labels = {
      environment = "development"
      project     = "todo-microservices"
    }

    annotations = {
      description = "A pod in todo-app namespace has sustained high CPU usage."
    }
  }


  ############################################
  # Pod Restart
  ############################################

  rule {

    enabled = true

    alert = "PodRestartingFrequently"

    expression = <<-EOT
      increase(
        kube_pod_container_status_restarts_total{
          namespace="todo-app"
        }[15m]
      ) > 3
    EOT

    for = "PT5M"

    severity = 2

    action {
      action_group_id = azurerm_monitor_action_group.email.id
    }

    alert_resolution {
      auto_resolved   = true
      time_to_resolve = "PT10M"
    }

    labels = {
      environment = "development"
      project     = "todo-microservices"
    }

    annotations = {
      description = "A container in todo-app namespace is restarting frequently."
    }
  }

  tags = var.tags
}
