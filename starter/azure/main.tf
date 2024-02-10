data "azurerm_resource_group" "udacity" {
  name     = "Regroup_8doSP1ri"
}

resource "azurerm_container_group" "udacity" {
  name                = "udacity-continst"
  location            = data.azurerm_resource_group.udacity.location
  resource_group_name = data.azurerm_resource_group.udacity.name
  ip_address_type     = "Public"
  dns_name_label      = "udacity-harshit-azure"
  os_type             = "Linux"

  container {
    name   = "azure-container-app"
    image  = "docker.io/tscotto5/azure_app:1.0"
    cpu    = "0.5"
    memory = "1.5"
    environment_variables = {
      "AWS_S3_BUCKET"       = "udacity-harshit-aws-s3-bucket",
      "AWS_DYNAMO_INSTANCE" = "udacity-harshit-aws-dynamodb"
    }
    ports {
      port     = 3000
      protocol = "TCP"
    }
  }
  tags = {
    environment = "udacity"
  }
}

####### Your Additions Will Start Here ######

resource "azurerm_mssql_server" "udacity_mssql_server" {
  name                         = "udacity-harshit-azure-sql"
  resource_group_name          = data.azurerm_resource_group.udacity.name
  location                     = data.azurerm_resource_group.udacity.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssword1234" # Please use a more secure password and consider using Terraform variables

  tags = {
    environment = "udacity"
  }
}

resource "azurerm_sql_database" "udacity_sql_db" {
  name                = "udacity-harshit-azure-sql"
  resource_group_name = data.azurerm_resource_group.udacity.name
  location            = data.azurerm_resource_group.udacity.location
  server_name         = azurerm_mssql_server.udacity_mssql_server.name

  tags = {
    environment = "udacity"
  }
}

resource "random_string" "udacity_suffix" {
  length  = 8
  special = false
  upper   = false
}


resource "azurerm_app_service_plan" "udacity_app_service_plan" {
  name                = "udacity-harshit-azure-dotnet-app"
  location            = data.azurerm_resource_group.udacity.location
  resource_group_name = data.azurerm_resource_group.udacity.name

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = {
    environment = "udacity"
  }
}

resource "azurerm_app_service" "udacity_app_service" {
  name                = "udacity-harshit-azure-dotnet-app"
  location            = data.azurerm_resource_group.udacity.location
  resource_group_name = data.azurerm_resource_group.udacity.name
  app_service_plan_id = azurerm_app_service_plan.udacity_app_service_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "DOTNET_ENVIRONMENT" = "Production"
    "SQL_SERVER_URL"     = azurerm_mssql_server.udacity_mssql_server.fully_qualified_domain_name
  }

  tags = {
    environment = "udacity"
  }
}
