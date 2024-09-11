resource "azurerm_app_service_plan" "main" {
  name                = "blazor-app-service-plan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku {
    tier     = "Basic"
    size     = "B1"
    capacity = 1
  }
}

resource "azurerm_app_service" "main" {
  name                = "mipa-blazor-app-service"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id

  app_settings = {
    DOCKER_CUSTOM_IMAGE_NAME = "1300b27101be5563d8190c17f5f05e622f12316fcf7de04f1c9afc82caf03bf4"
  }

  # Valfritt: Du kan definiera stigen som din app kommer att ladda
  https_only = true
}
  
 

