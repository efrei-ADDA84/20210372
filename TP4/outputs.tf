output "resource_group_name" {
  value = data.azurerm_virtual_network.network.resource_group_name
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "tls_private_key" {
  value = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}
