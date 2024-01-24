terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "service-bus-module" {
  source = "git::https://github.com/mleisa/assignment.git"

  namespace_name = "namespace-aa"
  queue_name_and_dlq = {
    "queue1" = false
  }
  action_group_name = "team1"
  alert_rule = {
    rule-a = {
      alert_name         = "Servica-A-alert"
      metric_name        = "Messages"
      threshold          = 25
      dimension_operator = "Include"
      queue_name_list    = ["queue1"]
    }
  }
}
