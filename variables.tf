variable "subscription_id" {
  type = string
  description = "value of the Azure subscription ID to use for the deployment"
}

variable "location" {
  type = string
  description = "Azure region where resources will be deployed"
  default = "East US"
}

variable "location-sql" {
  type = string
  description = "Azure region where resources will be deployed"
  default = "Central US"
}

variable "tags" {
  type = map(string)
  description = "Tags to apply to resources"
  default = {
    environment = "development"
    project     = "pokemon"
    date        = "July 2023"
    created_by = "terraform"
  }
  
}

variable "project_name" {
  type = string
  description = "Name of the project for resource naming"
  default = "pokemonproject"
}

variable "environment" {
  type = string
  description = "Deployment environment (e.g., dev, test, prod)"
  default = "dev"
  
}

variable "administrator_login" {
  type = string
  description = "Administrator login for the PostgreSQL server"
  
}

variable "administrator_password" {
  type = string
  description = "Administrator password for the PostgreSQL server"
  sensitive = true
  
}