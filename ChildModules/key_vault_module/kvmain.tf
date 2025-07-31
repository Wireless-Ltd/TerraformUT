
# data "azurerm_client_config" "client" {
# }

# resource "azurerm_key_vault" "keyvault" {
#   name                        = var.key_vault_name
#   location                    = var.location
#   resource_group_name         = var.resource_group_name
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.client.tenant_id
#   soft_delete_retention_days  = 30
#   purge_protection_enabled    = false

#   sku_name = "standard"

  # access_policy {
  #   tenant_id = data.azurerm_client_config.client.tenant_id
  #   object_id = data.azurerm_client_config.client.object_id

  #   key_permissions = [
  #     "Get",
  #   ]

  #   secret_permissions = [
  #     "Get",
  #   ]

  #   storage_permissions = [
  #     "Get",
  #   ]
  # }
#}
