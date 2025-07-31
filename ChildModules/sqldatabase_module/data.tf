data "azurerm_mssql_server" "mysql" {
  name                = var.mssql_server_name
  resource_group_name = var.resource_group_name
}