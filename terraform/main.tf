provider "apigee" {
  org          = var.apigee_organization
  access_token = var.apigee_token
}

terraform {
  backend "azurerm" {}

  required_providers {
    apigee = "~> 0.0"
    archive = "~> 1.3"
  }
}

module "identity-service" {
  source             = "github.com/NHSDigital/api-platform-service-module"
  name               = "covid-19-testing-channel-availability"
  path               = "covid-19-testing-channel-availability"
  apigee_environment = var.apigee_environment
  proxy_type         = "live"
  namespace          = var.namespace
  make_api_product         = (length(var.namespace) == 0)
  api_product_display_name = "Covid-19 Testing Channel Availability"
  api_product_description  = ""
}
