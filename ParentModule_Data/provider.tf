terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG_BKEND_UT"             # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "stgutbkend"             # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "bkendcontainer"                # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "Terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    
    }

}

provider "azurerm" {
  features {}
  subscription_id = "8b0422c9-d3b4-4ad5-b676-1cd162a61f87" # Configuration options
}
