resource "azurerm_postgresql_server" "db-server" {
  name                = join("-", [var.prefix, "postgresql", "server"])
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "B_Gen5_2"
    capacity = 2
    tier     = "Basic"
    family   = "Gen5"
  }

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "psqladminun"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement              = "Enabled"
}

resource "azurerm_postgresql_database" "db" {
  name                = join("-", [var.prefix, "db"])
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.db-server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}