terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.resource_group.name
  location                 = data.azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    CreatedBy = "ControlMonkey Template"
  }
}

variable "storage_account_name" {
  description = "The name of the Storage Account to create."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing Azure Resource Group in which the Storage Account will be created."
  type        = string
}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}