terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.103.1"
    }
  }
}

provider "azurerm" {
  # Configuration options

  features {
    
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = "my-terraform-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname334"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}