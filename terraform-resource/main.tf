module "network" {
    source = "../Module/Network"
    vnet_name = var.vnet_name
    resource_group =  var.resource_group
    location = var.location
    vnet_address_space = var.vnet_address_space
    subnet_name = var.subnet_name
    subnet_address_space = var.subnet_address_space
}

module "azure_virtual_machine" {
    source = "../Module/Virtual_Machine"
    depends_on = [module.network.subnet]
    pubip = var.pubip
    nic = var.nic
    resource_group =  var.resource_group
    location = var.location
    nic_ip_config = var.nic_ip_config
    subnet_id = module.network.subnet_id
    nsg_name = var.nsg_name
    vm_name = var.vm_name
    vm_size = var.vm_size
}