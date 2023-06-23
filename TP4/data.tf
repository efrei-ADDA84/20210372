
data "azurerm_virtual_network" "network" {
  name                = "network-tp4"
  resource_group_name = "ADDA84-CTP"
}

data "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = data.azurerm_virtual_network.network.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.network.name

}