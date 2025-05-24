terraform {
  
  backend "azurerm" {
	subscription_id = "a3ad902a-bc21-450c-87ce-0df0440ab422"
	resource_group_name = "terraform-RG"
	storage_account_name = "terraformstatesydney33"
	container_name = "terraform"
	key = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.27.0"
    }
  }
}

provider "azurerm" {
	subscription_id = "a3ad902a-bc21-450c-87ce-0df0440ab422"
	#skip_provider_registration = true
	#resource_provider_registrations = true
	features {}
}
