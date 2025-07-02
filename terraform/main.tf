data "azurerm_client_config" "default" {}

module "avm-res-resources-resourcegroup" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.2.1"
  # insert the 2 required variables here
  name = "${var.name_prefix}-rg"
  location = var.location
  tags = var.tags
}








module "caf" {
  source = "github.com/OuterSrc/terraform-azurerm-caf.git?ref=v1.7.0"

  providers = {
    azurerm.vhub = azurerm.vhub
  }

  data_sources             = var.data_sources
  global_settings          = var.global_settings
  keyvault_access_policies = var.keyvault_access_policies
  keyvaults                = var.keyvaults
  log_analytics            = var.log_analytics
  managed_identities       = var.managed_identities
  resource_groups          = var.resource_groups
  role_mapping             = var.role_mapping
  storage_accounts         = var.storage_accounts
  tags                     = var.global_settings.tags

  cognitive_services = {
    cognitive_services_account = var.cognitive_services_account
  }

  compute = {
    virtual_machines       = var.virtual_machines
    wvd_application_groups = var.wvd_application_groups
    wvd_applications       = var.wvd_applications
    wvd_host_pools         = var.wvd_host_pools
    wvd_scaling_plans      = var.wvd_scaling_plans
    wvd_workspaces         = var.wvd_workspaces
  }

  data_factory = {
    data_factory                                 = var.data_factory
    data_factory_integration_runtime_self_hosted = var.data_factory_integration_runtime_self_hosted
  }

  data_protection = {
    backup_vault_instances = var.backup_vault_instances
    backup_vault_policies  = var.backup_vault_policies
    backup_vaults          = var.backup_vaults
  }

  database = {
    # analysis_services_server    = var.analysis_services_server
    databricks_workspaces       = var.databricks_workspaces
    machine_learning_workspaces = var.machine_learning_workspaces
    mssql_databases             = var.mssql_databases
    mssql_managed_databases     = var.mssql_managed_databases
    mssql_managed_instances     = var.mssql_managed_instances
    mssql_mi_administrators     = var.mssql_mi_administrators
    mssql_servers               = var.mssql_servers
    mysql_flexible_server       = var.mysql_flexible_server
  }

  diagnostics = {
    # diagnostic_event_hub_namespaces = var.diagnostic_event_hub_namespaces
    # diagnostic_log_analytics        = var.diagnostic_log_analytics
    diagnostic_storage_accounts = var.diagnostic_storage_accounts
    # diagnostics_definition          = var.diagnostics_definition
    # diagnostics_destinations        = var.diagnostics_destinations
  }

  identity = {
    active_directory_domain_service = var.active_directory_domain_service
  }

  logic_app = {
    logic_app_action_http    = var.logic_app_action_http
    logic_app_trigger_custom = var.logic_app_trigger_custom
    logic_app_workflow       = var.logic_app_workflow
  }

  # maps = {
  #   maps_accounts = var.maps_accounts
  # }

  networking = {
    application_gateway_applications  = var.application_gateway_applications
    application_gateways              = var.application_gateways
    application_security_groups       = var.application_security_groups
    azurerm_routes                    = var.azurerm_routes
    network_security_group_definition = var.network_security_group_definition
    network_watchers                  = var.network_watchers
    private_dns                       = var.private_dns
    private_endpoints                 = var.private_endpoints
    public_ip_addresses               = var.public_ip_addresses
    route_tables                      = var.route_tables
    vnet_peerings_v1                  = var.vnet_peerings_v1
    vnets                             = var.vnets
  }

  # search_services = {
  #   search_services = var.search_services
  # }

  shared_services = {
    automation_runbooks  = var.automation_runbooks
    automations          = var.automations
    image_definitions    = var.image_definitions
    image_galleries      = var.image_galleries
    monitor_action_group = var.monitor_action_group
    monitor_metric_alert = var.monitor_metric_alert
    recovery_vaults      = var.recovery_vaults
  }

  webapp = {
    app_service_plans            = var.app_service_plans
    azurerm_application_insights = var.azurerm_application_insights
    linux_web_apps               = var.linux_web_apps
  }
}
