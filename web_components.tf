resource "azurerm_service_plan" "sp-pokemon" {
  name = "sp-${var.project_name}-${var.environment}"
  location = var.location

  resource_group_name = azurerm_resource_group.rg-pokemon.name

  sku_name = "B1"
  os_type = "Linux"
  tags = var.tags
}

resource "azurerm_linux_web_app" "wp-api-pokemon" {
  name = "wp-api-${var.project_name}-${var.environment}"
  location = var.location

  resource_group_name = azurerm_resource_group.rg-pokemon.name
  service_plan_id = azurerm_service_plan.sp-pokemon.id

  site_config {
    always_on = false
  }

  app_settings = {
    WEBSITE_PORT = "8000"
  }

  tags = var.tags
}

resource "azurerm_linux_web_app" "wp-ui-pokemon" {
  name = "wp-ui-${var.project_name}-${var.environment}"
  location = var.location

  resource_group_name = azurerm_resource_group.rg-pokemon.name
  service_plan_id = azurerm_service_plan.sp-pokemon.id

  site_config {
    always_on = false
  }

  app_settings = {
    WEBSITE_PORT = "8080"
  }

  tags = var.tags
  
}