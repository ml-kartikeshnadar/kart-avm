variable "name_prefix" {
  description = "Prefix for the name of the resources"
  type        = string
  default     = "example"
}

variable "location" {
  description = "The Azure location to deploy the resources"
  type        = string
  default     = "East US"
}

variable "virtual_network_cidr" {
  description = "The CIDR prefix for the virtual network. This should be at least a /22. Example 10.0.0.0/22"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {}
}


variable "active_directory_domain_service" {
  description = "Active Directory Domain Service"
  default     = {}
}

variable "app_service_plans" {
  description = "App service plans"
  default     = {}
}

variable "application_gateway_applications" {
  description = "Application gateway applications"
  default     = {}
}

variable "application_gateways" {
  description = "Application gateways"
  default     = {}
}

variable "application_security_groups" {
  description = "Application security group"
  default     = {}
}

variable "automation_runbooks" {
  description = "Automation Runbooks"
  default     = {}
}

variable "automations" {
  description = "Automation Account"
  default     = {}
}

variable "azurerm_analysis_services_server" {
  description = "Azurerm analysis services server"
  default     = {}
}

variable "azurerm_application_insights" {
  description = "Azurerm application insights"
  default     = {}
}

variable "azurerm_maps_account" {
  description = "Azurerm maps account"
  default     = {}
}

variable "azurerm_routes" {
  description = "azurerm routes"
  default     = {}
}

variable "azurerm_search_service" {
  description = "Azurerm search service"
  default     = {}
}

variable "backup_vault_instances" {
  description = "Backup vault instances"
  default     = {}
}

variable "backup_vault_policies" {
  description = "Backup vault policies"
  default     = {}
}

variable "backup_vaults" {
  description = "Backup vaults"
  default     = {}
}

variable "cognitive_services_account" {
  description = "Cognitive services account"
  default     = {}
}

variable "compute_tags" {
  description = "Compute tags"
  default     = {}
}

variable "custom_role_definitions" {
  description = "Custom role definitions"
  default     = {}
}

variable "data_factory" {
  description = "Data factory"
  default     = {}
}

variable "data_factory_integration_runtime_self_hosted" {
  description = "Data factory integration runtime self hosted"
  default     = {}
}

variable "data_sources" {
  default     = {}
  description = "Data sources"
}

variable "databricks_workspaces" {
  description = "Databricks workspaces"
  default     = {}
}

variable "diagnostic_storage_accounts" {
  description = "Diagnostic storage accounts"
  default     = {}
}

variable "global_settings" {
  description = "Global settings"
  default     = {}
}

variable "image_definitions" {
  description = "Image definitions"
  default     = {}
}

variable "image_galleries" {
  description = "Image galleries"
  default     = {}
}

variable "keyvault_access_policies" {
  description = "Keyvault access policies"
  default     = {}
}

variable "keyvaults" {
  description = "Keyvault definitions"
  default     = {}
}

variable "linux_web_apps" {
  description = "Linux web apps"
  default     = {}
}

variable "log_analytics" {
  description = "Log analytics"
  default     = {}
}

variable "logic_app" {
  description = "Logic app"
  default     = {}
}

variable "logic_app_action_http" {
  description = "logic_app_action_http"
  default     = {}
}

variable "logic_app_trigger_custom" {
  description = "logic_app_trigger_custom"
  default     = {}
}

variable "logic_app_workflow" {
  description = "logic_app_workflow"
  default     = {}
}

variable "managed_identities" {
  description = "Managed identities"
  default     = {}
}

variable "monitor_action_group" {
  description = "Monitor action group"
  default     = {}
}

variable "monitor_autoscale_settings" {
  description = "monitor_autoscale_settings"
  default     = {}
}

variable "monitor_metric_alert" {
  description = "Monitor metric alert"
  default     = {}
}

variable "machine_learning_workspaces" {
  description = "Machine learning workspaces"
  default     = {}
}

variable "mssql_databases" {
  description = "MSSQL databases"
  default     = {}
}

variable "mssql_managed_databases" {
  description = "MSSQL managed databases"
  default     = {}
}

variable "mssql_managed_instances" {
  description = "MSSQL managed instances"
  default     = {}
}

variable "mssql_mi_administrators" {
  description = "MSSQL mi administrators"
  default     = {}
}

variable "mssql_servers" {
  description = "MSSQL servers"
  default     = {}
}

variable "mysql_flexible_server" {
  description = "mysql_flexible_server"
  default     = {}
}

variable "networking_tags" {
  description = "Networking tags"
  default     = {}
}

variable "network_security_group_definition" {
  description = "Network security group definition"
  default     = {}
}

variable "network_watchers" {
  description = "Network watchers"
  default     = {}
}

variable "private_dns" {
  description = "Private DNS"
  default     = {}
}

variable "private_endpoints" {
  description = "Private endpoints"
  default     = {}
}

variable "provider_azurerm_features_keyvault" {
  description = "Provider Azurerm features keyvault"
  default     = {}
}

variable "public_ip_addresses" {
  description = "Public IP addresses"
  default     = {}
}

variable "recovery_vaults" {
  description = "Recovery vaults"
  default     = {}
}

variable "resource_groups" {
  description = "Resource groups"
  default     = {}
}

variable "role_mapping" {
  description = "Role mapping"
  default     = {}
}

variable "route_tables" {
  description = "Route tables"
  default     = {}
}

variable "storage_accounts" {
  description = "Storage accounts"
  default     = {}
}

variable "tags" {
  description = "Global tags"
  default     = {}
}

variable "virtual_machine_extensions" {
  description = "Virtual machine extensions definitions"
  default     = {}
}

variable "virtual_machines" {
  description = "Virtual machine definitions"
  default     = {}
}

variable "vnet_peerings_v1" {
  description = "Virtual network peerings"
  default     = {}
}

variable "vnets" {
  description = "Virtual networks"
  default     = {}
}

variable "wvd_application_groups" {
  description = "WVD application groups"
  default     = {}
}

variable "wvd_applications" {
  description = "WVD applications"
  default     = {}
}

variable "wvd_host_pools" {
  description = "WVD host pools"
  default     = {}
}

variable "wvd_scaling_plans" {
  description = "WVD scaling plans"
  default     = {}
}

variable "wvd_workspaces" {
  description = "WVD workspaces"
  default     = {}
}
