terraform {
  required_version = "~>1.8.5" # Must match terraformVersion in pipeline.yml
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.105.0"
      configuration_aliases = [
        azurerm.vhub
      ]
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias           = "vhub"
  subscription_id = data.azurerm_client_config.default.subscription_id
  tenant_id       = data.azurerm_client_config.default.tenant_id
}
