variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_location" {}

variable "resource_group_name" { }

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}
