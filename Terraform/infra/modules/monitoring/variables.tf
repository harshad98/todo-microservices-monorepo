variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}

variable "monitor_workspace_name" {
  description = "Azure Monitor Workspace Name"
  type        = string
}

variable "grafana_name" {
  description = "Azure Managed Grafana Name"
  type        = string
}

variable "tags" {
  description = "Common Tags"
  type        = map(string)
}

variable "alert_email" {
  description = "Email address for Azure Monitor alerts"
  type        = string
}

variable "resource_group_id" {
  type = string
}

variable "aks_cluster_id" {
  type = string
}

variable "grafana_admin_object_id" {
  type = string
}

variable "grafana_token" {
  description = "Grafana Service Account Token"
  type        = string
  sensitive   = true
}
