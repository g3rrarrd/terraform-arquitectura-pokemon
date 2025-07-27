resource "azurerm_storage_account" "sa-pokemon" {
  name = "st${var.project_name}${var.environment}"
  location = var.location

  resource_group_name = azurerm_resource_group.rg-pokemon.name

  account_tier = "Standard"
  account_replication_type = "LRS"
  
  tags = var.tags
}

resource "azurerm_storage_account" "sa-pokemon-2" {
  name = "st${var.project_name}${var.environment}func"
  location = var.location

  resource_group_name = azurerm_resource_group.rg-pokemon.name

  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_container" "c1-asa1-pokemon" {
  name = "container-${var.project_name}-${var.environment}"
  storage_account_id = azurerm_storage_account.sa-pokemon.id
  container_access_type = "private"
  
}

resource "azurerm_storage_queue" "q1-asa1-pokemon" {
  name = "queue-${var.project_name}-${var.environment}"
  storage_account_name = azurerm_storage_account.sa-pokemon.name
}