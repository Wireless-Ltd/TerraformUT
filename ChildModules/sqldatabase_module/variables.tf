variable "sql_database_name" {}
#variable "sql_server_id" {}
variable "resource_group_name" {
  description = "The name of the resource group where the SQL database will be created."
}
variable "mssql_server_name" {
  description = "The name of the MySQL server to which the SQL database will be linked."
}   
