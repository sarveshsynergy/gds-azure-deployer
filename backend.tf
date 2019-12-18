terraform {
  backend "azurerm" {
    resource_group_name  = "sarvesh-pg-rg"
    storage_account_name = "sarveshpgstorageaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}