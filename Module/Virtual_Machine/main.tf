resource "azurerm_public_ip" "pubip" {
	name = var.pubip
	location = var.location
	resource_group_name = var.resource_group
	allocation_method = "Static"  
}

resource "azurerm_network_interface" "nic" {
	name = var.nic
	location = var.location
	resource_group_name = var.resource_group
	ip_configuration {
	  name = var.nic_ip_config
	  subnet_id = var.subnet_id
	  private_ip_address_allocation = "Dynamic"
	  public_ip_address_id = azurerm_public_ip.pubip.id
	}  
}

resource "azurerm_network_security_group" "nsg" {
	name = var.nsg_name
	location = var.location
	resource_group_name = var.resource_group
	security_rule {
		access = "Allow"
		direction = "Inbound"
		name = "ssh"
		priority = 100
		protocol = "Tcp"
		source_port_range = "*"
		source_address_prefix = "*"
		destination_port_range = 22
		destination_address_prefix = azurerm_network_interface.nic.private_ip_address
	}
	security_rule {
		access = "Allow"
		direction = "Outbound"
		name = "internet"
		priority = 100
		protocol = "Tcp"
		source_port_range = "*"
		source_address_prefix = azurerm_network_interface.nic.private_ip_address
		destination_port_range = "*"
		destination_address_prefix = "*"
	}  
}

resource "azurerm_network_interface_security_group_association" "nsg_nic_association" {
	network_interface_id = azurerm_network_interface.nic.id
	network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_ssh_public_key" "sshkey" {
  	name  = "azurevmsydney-breeze"
	location = var.location
	resource_group_name = var.resource_group
  	public_key  = file("azurevm.pub")
}

resource "azurerm_linux_virtual_machine" "azurevm" {
	name = var.vm_name
	location = var.location
	resource_group_name = var.resource_group
	size = var.vm_size
	admin_username = "adminuser"
	network_interface_ids = [azurerm_network_interface.nic.id]
	admin_ssh_key {
		username = "adminuser"
		public_key = file("~/.ssh/azurevm.pub")
	}
	os_disk {
		storage_account_type = "Standard_LRS"
		caching = "ReadWrite"
	}
	source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}