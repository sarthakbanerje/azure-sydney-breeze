variable "location" {
	type = string
	default = "eastus"
}
variable "resource_group" {
	type = string
	default="sydnet-breeze-RG"
}
variable "vnet_name" {
	type = string
	default = "sydney_breeze_vnet" 
}
variable "vnet_address_space" {
	type = string
	default = "10.3.0.0/16"
}
variable "subnet_name" {
	type = string
	default = "sydney_breeze_subnet_1" 
}
variable "subnet_address_space" {
	type = string
	default = "10.3.1.0/24" 
}