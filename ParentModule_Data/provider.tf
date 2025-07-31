terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "805cc58a-b2c1-4e91-97ec-b0ba35c3dc96" # Configuration options
}
