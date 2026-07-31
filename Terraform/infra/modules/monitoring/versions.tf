terraform {
  required_providers {

    azurerm = {
      source = "hashicorp/azurerm"
    }

    grafana = {
      source  = "grafana/grafana"
      version = "~> 3.20"
    }

  }
}