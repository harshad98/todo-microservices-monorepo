resource "azurerm_monitor_alert_prometheus_rule_group" "recording_rules" {

  name                = "todo-recording-rules"
  location            = var.location
  resource_group_name = var.resource_group_name

  scopes = [
    azurerm_monitor_workspace.this.id
  ]

  interval = "PT1M"

  ############################################
  # Pod CPU Usage
  ############################################

  rule {

    enabled = true

    record = "todo:pod_cpu_usage:rate5m"

    expression = <<-EOT
      sum by (namespace, pod) (
        rate(container_cpu_usage_seconds_total{
          container!="",
          container!="POD"
        }[5m])
      )
    EOT
  }


  ############################################
  # Pod Memory Usage
  ############################################

  rule {

    enabled = true

    record = "todo:pod_memory_working_set:sum"

    expression = <<-EOT
      sum by (namespace, pod) (
        container_memory_working_set_bytes{
          container!="",
          container!="POD"
        }
      )
    EOT
  }

  tags = var.tags
}