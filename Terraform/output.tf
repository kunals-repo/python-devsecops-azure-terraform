output "vm_public_ip" {
    value = azurerm_linux_virtual_machine.linux-vm-block.public_ip_address
    description = "This will output vm public ip & store in github secret"
}

output "vm_hostname" {
    value = azurerm_linux_virtual_machine.linux-vm-block.admin_username
    description = "This will output vm hostname & store in github secret"
}