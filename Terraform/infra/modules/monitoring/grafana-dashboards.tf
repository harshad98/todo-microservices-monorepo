locals {

  dashboard_files = fileset("${path.module}/dashboards", "**/*.json")

}

resource "grafana_dashboard" "dashboard" {

  for_each = toset(local.dashboard_files)

  config_json = file("${path.module}/dashboards/${each.value}")

}