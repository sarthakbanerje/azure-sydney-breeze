variable "pubip" {
	type= string
	default = "public_ip_Sydney_breeze_Web" 
}
variable "location" {
	type = string
	default = "eastus"
}
variable "resource_group" {
	type = string
	default = "sydney-breeze-RG"
}
variable "nic" {
	type= string
	default = "nic_Sydney_breeze_Web" 
}
variable "nic_ip_config" {
	type= string
	default = "nic_ip_config_Sydney_breeze_Web" 
}
variable "subnet_id" {
	type= string
	default = " " 
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