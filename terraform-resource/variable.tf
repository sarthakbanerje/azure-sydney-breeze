variable "location" {
	type = string
	default = "eastus"
}
variable "resource_group" {
	type = string
	default = "sydney-breeze-RG"
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
variable "pubip" {
	type= string
	default = "public_ip_Sydney_breeze_Web" 
}
variable "nic" {
	type= string
	default = "nic_Sydney_breeze_Web" 
}
variable "nic_ip_config" {
	type= string
	default = "nic_ip_config_Sydney_breeze_Web" 
}
variable "nsg_name" {
	type = string
	default = "Sydney-breeze-Web-NSG"  
}
variable "vm_name" {
	type = string
	default = "Sydney-Breeze-Virtial-Machine"  
}
variable "vm_size" {
	type = string
	default = "Standard_B2s"  
}