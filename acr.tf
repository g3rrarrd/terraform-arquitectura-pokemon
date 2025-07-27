resource "azurerm_container_registry" "acr-pokemon" {
  name = "acr${var.project_name}${var.environment}"
  location = var.location

  resource_group_name = azurerm_resource_group.rg-pokemon.name

  admin_enabled = true

  sku = "Basic"

  tags = var.tags
}