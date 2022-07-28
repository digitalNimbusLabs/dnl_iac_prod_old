# You can use the azurerm_client_config data resource to dynamically
# extract connection settings from the provider configuration.

data "azurerm_client_config" "core" {}

# Call the caf-enterprise-scale module directly from the Terraform Registry
# pinning to the latest version

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "2.1.2"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = "dnl"
  root_name      = "Digital Nimbus Labs"
  library_path   = "${path.root}/lib"
  
  deploy_management_resources = true
  subscription_id_management  = data.azurerm_client_config.core.subscription_id
  configure_management_resources = local.configure_management_resources
  
  custom_landing_zones = {
    "${var.root_id}-prod" = {
      display_name               = "${upper(var.root_id)} Prod"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-nonprod" = {
      display_name               = "${upper(var.root_id)} NonProd"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
  }



}
