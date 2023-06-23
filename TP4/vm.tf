resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}
resource "azurerm_public_ip" "public_ip" {
  name                = "20210372-public-ip"
  location            = data.azurerm_virtual_network.network.location
  resource_group_name = data.azurerm_virtual_network.network.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic20210372" {
  name                = "nic20210372"
  location            = data.azurerm_virtual_network.network.location
  resource_group_name = data.azurerm_virtual_network.network.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "devops-20210372"
  resource_group_name = data.azurerm_virtual_network.network.resource_group_name
  location            = data.azurerm_virtual_network.network.location
  size                = "Standard_D2s_v3"
  admin_username      = "devops"
  disable_password_authentication = true

  admin_ssh_key {
    username       = "devops"
    public_key = tls_private_key.ssh_key.public_key_openssh 
  }

  os_disk {
    name                 = "20210372-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  network_interface_ids = [azurerm_network_interface.nic20210372.id]
}

