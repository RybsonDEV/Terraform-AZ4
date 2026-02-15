#AZ1
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
  subnet_name        = var.subnet_name
  subnet_prefix      = var.subnet_prefix
  nsg_name           = var.nsg_name

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  public_ip_name    = var.public_ip_name
  lb_name           = var.lb_name
  backend_pool_name = var.backend_pool_name
  probe_name        = var.probe_name
  lb_rule_name      = var.lb_rule_name
}
module "vmss" {
  source = "./modules/vmss"

  vmss_name      = var.vmss_name
  vm_size        = var.vm_size
  instance_count = var.instance_count

  admin_username = var.admin_username
  admin_password = var.admin_password

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  subnet_id       = module.network.subnet_id
  backend_pool_id = module.loadbalancer.backend_pool_id
}
