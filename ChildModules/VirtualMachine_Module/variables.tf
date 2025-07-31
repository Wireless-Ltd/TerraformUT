variable "nic_name" {}
variable "location" {}
variable "resource_group_name" {}
#variable "subnet_id" {}
  variable "vm_name" {}
  variable "vm_size" {}
  #variable "admin_username" {}
  #variable "admin_password" {} 
  variable "image_publisher" {}
  variable "image_offer" {}    
  variable "image_sku" {}
  variable "image_version" {}
  #variable "pip_id" {}
  
  # variables in data block
  variable "vnet_name" {}
  variable "common_pip_name" {}
  variable "common_subnet_name" {}
  
  #variable declation related to key vault.
  variable "key_vault_name" {}
  variable "username_secret_name" {}
  variable "password_secret_name" {}
    
  
    
