terraform {
  required_version = ">= 1.8.0"

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }

    grafana = {
      source  = "grafana/grafana"
      version = "~>3.20"
    }


    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.35"
    }

    # helm = {
    #   source  = "hashicorp/helm"
    #   version = "~> 2.15"
    # }

  }
}

# provider "azurerm" {
#   features {}
# }
