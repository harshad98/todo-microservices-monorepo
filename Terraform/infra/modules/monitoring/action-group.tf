resource "azurerm_monitor_action_group" "email" {

  name                = "todo-email-alerts"
  resource_group_name = var.resource_group_name
  short_name          = "todo"

  email_receiver {

    name          = "admin"

    email_address = var.alert_email

    use_common_alert_schema = true
  }

  tags = var.tags
}