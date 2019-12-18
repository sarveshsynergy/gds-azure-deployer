resource "azurerm_eventhub_namespace" "eh" {
  name                = join("-", [var.prefix, "namespace"])
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  capacity            = 2

  tags = {
    environment = var.environment
  }
}