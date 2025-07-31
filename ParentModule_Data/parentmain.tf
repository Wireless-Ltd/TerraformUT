module "resource_group1" {
source = "../ChildModules/Resource_group_Module"
resource_group_name = "rg_ut"
resource_group_location = "centralus"
}

module "vnet_ut" {
    depends_on = [module.resource_group1]
    source                = "../ChildModules/Vnet_Module"
    vnet_name             = "vnet_ut"
    vnet_location         = "centralus"
    resource_group_name   = "rg_ut"
    vnet_address_space    = ["10.0.0.0/16"]
}

module "frontend_subnet" {
    depends_on = [module.vnet_ut]
    source                = "../ChildModules/subnet_module"
    subnet_name = "frontendsubnet_ut"
    resource_grp_name = "rg_ut"
    virtual_network_name = "vnet_ut"
    subnet_address_prefixes = ["10.0.1.0/24"]
}

module "backend_subnet" {
    depends_on = [module.vnet_ut]
    source                = "../ChildModules/subnet_module"
    subnet_name = "backendsubnet_ut"
    resource_grp_name = "rg_ut"
    virtual_network_name = "vnet_ut"
    subnet_address_prefixes = ["10.0.2.0/24"]
}


module "public_ip_frontend" {
   depends_on = [module.resource_group1]
    source                = "../ChildModules/public_ip"
    public_ip_name        = "pip_frontend_ut"
    resource_group_name   = "rg_ut"
    location              = "centralus"
    allocation_method     = "Static"
  
}

module "public_ip_backend" {
   depends_on = [module.resource_group1]   # depends on subnet.
    source                = "../ChildModules/public_ip"
    public_ip_name        = "pip_backend_ut"
    resource_group_name   = "rg_ut"
    location              = "centralus"
    allocation_method     = "Static"
  
}

module "Frontend_virtual_machine" {
    depends_on = [module.frontend_subnet, module.public_ip_frontend]
    source                = "../ChildModules/VirtualMachine_Module"
    vm_name               = "frontendvm-ut"
    resource_group_name   = "rg_ut"
    location              = "centralus"
    #admin_username        = "umairvmfrt"
    #admin_password        = "Password12345!"
    nic_name              = "nicfront_ut"
    vm_size               = "Standard_B1s"
    image_publisher       = "Canonical"
    image_offer           = "0001-com-ubuntu-server-focal"
    image_sku             = "20_04-lts"
    image_version         = "latest"
    #subnet_id = "/subscriptions/3fed4955-0ed0-4498-a979-f538b3d003fa/resourceGroups/rg_ut/providers/Microsoft.Network/virtualNetworks/vnet_ut/subnets/frontendsubnet_ut"
    #pip_id = "/subscriptions/3fed4955-0ed0-4498-a979-f538b3d003fa/resourceGroups/rg_ut/providers/Microsoft.Network/publicIPAddresses/pip_ut"
    vnet_name = "vnet_ut"
    common_subnet_name = "frontendsubnet_ut"
    common_pip_name = "pip_frontend_ut"
    key_vault_name = "G30-KeyVault"
    username_secret_name = "vm-username-frt" #this is the name of secret, can be given manually if creating from portal
    password_secret_name = "vm-password-frt"
}



module "backend_virtual_machine" {
    depends_on = [module.backend_subnet, module.public_ip_backend]
    source                = "../ChildModules/VirtualMachine_Module"
    vm_name               = "backendvm-ut"
    resource_group_name   = "rg_ut"
    location              = "centralus"
   # admin_username        = "umairvm"
   # admin_password        = "Password12345!"
    nic_name              = "nicback_ut"
    vm_size               = "Standard_B1s"
    image_publisher       = "Canonical"
    image_offer           = "0001-com-ubuntu-server-focal"
    image_sku             = "20_04-lts"
   image_version         = "latest"
    #subnet_id = "/subscriptions/3fed4955-0ed0-4498-a979-f538b3d003fa/resourceGroups/rg_ut/providers/Microsoft.Network/virtualNetworks/vnet_ut/subnets/backendsubnet_ut"
    vnet_name = "vnet_ut"
    common_subnet_name = "backendsubnet_ut"
    common_pip_name = "pip_backend_ut"
    key_vault_name = "G30-KeyVault"
    username_secret_name = "vm-username-bk"
    password_secret_name = "vm-password-bk"
}

# module "vm-username" {
#     depends_on = [module.resource_group1]
#     source                = "../ChildModules/secret_value_module"
#     key_vault_name        = "kv-ut-test"
#     resource_group_name   = "rg_ut"
#     secret_name           = "vm-username"
#     secret_value          = "umairvm"
# }


module "sql_server" {
    depends_on = [module.resource_group1]
    source                = "../ChildModules/sqlserver_module"
    sql_server_name       = "mssqlserver-ut"
    resource_group_name   = "rg_ut"
    location              = "centralus"
    admin_login           = "sqlumair"
    admin_password        = "Password1234!"
}

# sql server id is only known once sql server is created. copy from portal sql server json view
  
module "sql_database" {
    depends_on = [module.sql_server]
    source                = "../ChildModules/sqldatabase_module"
    sql_database_name     = "sqldatabase-ut"
    #sql_server_id         = "/subscriptions/3fed4955-0ed0-4498-a979-f538b3d003fa/resourceGroups/rg_ut/providers/Microsoft.Sql/servers/sqlserver-ut"
    resource_group_name   = "rg_ut"
    mssql_server_name     = "mssqlserver-ut"
}

# Variable definations 

# module  key_vault {
#     depends_on = [module.resource_group1]
#     source                = "../ChildModules/key_vault_module"
#     key_vault_name        = "kv-ut-test"
#     location              = "centralindia"
#     resource_group_name   = "rg_ut"
# }


