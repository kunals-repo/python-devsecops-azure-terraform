
// Providers block added :

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>4.61.0"
    } 
  }
  
  required_version = "~> 1.14.5"   // version changed from 1.8.5 to 1.14.5 
}

provider "azurerm" {
   features {

   }
  # Configuration options
}

resource "azurerm_resource_group" "rg-block" {
  name = "linux-vm-rg"
  location = "centralus"
}

resource "azurerm_virtual_network" "vnet-block" {
  name                = "vnet"
  address_space       = ["10.0.0.0/24"]
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name
}

resource "azurerm_subnet" "subnet-block" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg-block.name
  virtual_network_name = azurerm_virtual_network.vnet-block.name
  address_prefixes     = ["10.0.0.0/25"]
}

resource "azurerm_network_security_group" "nsg-rules" {
  name                = "nsg-rule-vm"
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "nic-card" {
  name                = "nic"
  location            = azurerm_resource_group.rg-block.location
  resource_group_name = azurerm_resource_group.rg-block.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-block.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm-block" {
  name                = "linux-vm"
  resource_group_name = azurerm_resource_group.rg-block.name
  location            = azurerm_resource_group.rg-block.location
  size                = "Standard_F2"
  admin_username      = "kunal"
  network_interface_ids = [
    azurerm_network_interface.nic-card.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

custom_data = base64encode(<<EOF
#!/bin/bash
apt update
apt install -y python3-pip python3-venv nginx git
EOF
  )
}
