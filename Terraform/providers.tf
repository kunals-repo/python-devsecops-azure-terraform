
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
