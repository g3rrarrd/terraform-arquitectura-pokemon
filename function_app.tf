resource "azurerm_linux_function_app" "fa-pokemon" {
  name = "fa-${var.project_name}-${var.environment}"
  location = var.location

  resource_group_name = azurerm_resource_group.rg-pokemon.name
  service_plan_id = azurerm_service_plan.sp-pokemon.id

  storage_account_name = azurerm_storage_account.sa-pokemon-2.name
  storage_account_access_key = azurerm_storage_account.sa-pokemon-2.primary_access_key

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  tags = var.tags
}