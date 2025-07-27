resource "azurerm_postgresql_flexible_server" "postgres-server" {
  name = "postgres-${var.project_name}-${var.environment}"
  location = var.location-sql

  resource_group_name = azurerm_resource_group.rg-pokemon.name

  administrator_login = var.administrator_login
  administrator_password = var.administrator_password

  sku_name = "B_Standard_B1ms"
  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled = false
  storage_mb = 32768
  version = "13"
  zone = "1"
  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "postgres-database" {
  name = "db${var.project_name}${var.environment}"
  
  server_id = azurerm_postgresql_flexible_server.postgres-server.id

  charset = "UTF8"
  collation = "en_US.utf8"
  
}