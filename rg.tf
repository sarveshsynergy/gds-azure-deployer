resource "azurerm_resource_group" "rg" {
  name     = join("-", [var.prefix, "rg"])
  location = var.location
}

