# lz-sg-sol (avm)

Template repo for application landing zone deployment, with accumulated AVM example configuration and guidance

# Your help is required

The template is always WIP - your help is required to build out the template and make it increasingly useful for everyone, and to help maintain it. When you use this template, If you find that you need to add a resource type, or an option that did not exist in the template, or discover that part of the template no longer works, or that a previously unsupported resource has become supported by aztfmod, please raise an issue including your working example so that it can be added to the template

# Notes on the approach

* There is a tfvars file for every aztfmod module
* The name of the tfvars file is the same as the module name. For example:
  - in main.tf `managed_identities = var.managed_identities`
  - therefore the tfvars file name is `managed_identities.tfvars`
  - which contains `managed_identities = { ... }`
  - Where the module name starts 'azurerm_' this is removed from the tfvars filename to make the files easier to find (e.g. routes is next to route_tables instead of in azurerm_routes)
* Unused tfvars files must be deleted
* Each repo contains all environments - dev, test, prod - their associated terraform files are in subdirectories in `terraform/env`
* Each repo contains a single pipeline.yml. Environment specific pipeline variables files are in subdirectories in `pipeline/env`
* Where the requirements (LLD or other design) state that a configuration setting is required and it turns out that that setting is the default, our policy is to explicitly code that setting anyway so that it is clearly visible in the code that that is the required configuration
* There are occasions when aztfmod contains bugs. On such occasions the [OuterSrc Process](https://dev.azure.com/sercoazure/Azure%20-%20Enterprise%20Scale/_wiki/wikis/Azure---Enterprise-Scale.wiki/209/GitHub-OuterSrc#) is to be followed. In the event that the resource type is not supported in aztfmod, a ServiceNow request must be raised for development work to add the required functionality.

# Code hygiene

* Files must use TAB = 2x space. In VSCode select 'Spaces' in the bottom right toolbar, click 'Indent using spaces', select 2
* Everything is to be kept in alphabetical order. This includes the order of modules and submodules in main.tf, the order of parameters in tfvars files, the order of variables in variables.tf, the order of tfvars files in pipeline.yml, etc. (note that _ precedes a)
* Non-nested parameters should be listed first (in alphabetical order), followed by nested parameters (in alphabetical order), as follows:

  ```
    storage_accounts = var.storage_accounts
    tags             = var.global_settings.tags

    compute = {
      virtual_machines = var.virtual_machines
    }

    diagnostics = {
      diagnostic_storage_accounts = var.diagnostic_storage_accounts
    }
  ```
* Unused code in tfvars files should be deleted. Don't leave commented, unused chunks of code in files unless there is a specific reason to do so, in which case you must add a note to explain.
* **DO NOT** change key names. If you alter the key names to something memorable and specific to your code, when someone copies your code and does not understand the reference they tend to leave your name intact and we end up with key names that reference a specific solution that are not relevant to the new solution. If you need to label the generic key name to help you remember what it's for, use a note. For example:

Correct...
```
storage_accounts = {
  st01 = { # WVD profiles
```
Incorrect...
```
storage_accounts = {
  wvd_profiles = {
```

# Links

Engineers are invited to provide helpful links to documentation, to be commented inline (in tfvars files) with '# See link 1' and the link provided below, following the given example format 

E.g. `Link number. Name of link (optional '- variable_name or other helpful identifier')`

1. [Serco Cloud Naming Convention](https://microland.sharepoint.com/:w:/s/B2GDevOps/Ecv1kG6x4ydDnY2j7KQF0roBlPgxGVL2elBr0bx0StxlqA?e=QrIa2Y)
2. [Serco IT Naming Standard](https://microland.sharepoint.com/:w:/s/B2GDevOps/EU2JDdGVNNZOo4wVDBD0s0MBu9pfK9iWAXujSoy_TF_EdQ?e=ogjXmg)
3. [Serco Tagging Taxonomy](https://serco.sharepoint.com/:x:/r/sites/CSS-HostingandCloud/Shared%20Documents/Hosting%20-%20Standard%20Service/Cloud%20and%20Hosting%20-%20Standard%20Service%20Collateral/Azure%20Tagging/Azure%20Customer%20Tagging%20Taxonomy.xlsx?d=wa0fa34070a0744f4b7b19c382fd82a6e&csf=1&web=1&e=F2VNmg)
4. [private_endpoints.tfvars - subresource_names](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource)
5. [Azure permissions](https://learn.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations)
6. [Azure Built-In Roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles)

# Engineer notes

Engineers are invited to provide comments in their repos to explain anomalies, deviations etc, and to provide helpful information. Avoid excessive text in code files. Inline comments (i.e. within the code) must be at the end of the relevant line, start with hash # and should be fewer than 5 words, for example:
```
     storage_account_type = "GRS" # Optional - defaults to GRS (Geo)
```
Notes longer than 5 words should say '# See note <number>' to point to a full length note below. Notes should be marked 'Deprecated' when they are no longer relevant. Don't delete the number of the note as this affects the numbering overall.

The format of the note ensures that the reference is two-way; we are alerted to the note by the inline reference in the code, or we can read through the notes here and find the related piece of code from the reference in the note. The reference may be a code reference in dotted format, a pointer to a label, or may be omitted if the entire file is the reference

So, the format of the notes is: `Note number. **file name** - *reference* - Free text`

Please append '# <friendly_name>' to lines containing subscription or user IDs to help identify the object being referenced

E.g. `azureSubscription: 'bcbce6a3-f465-4029-bcf9-62bfdd322ef8' # lz-sgd-mia`

## Notes

1. **virtual_machines.tfvars** - *virtual_machines.vm01.virtual_machine_settings.windows.secure_boot_enabled* - If set to true, then in **recovery_vaults.tfvars** must set *recovery_vaults.rsv01.backup_policies.vms.policy01.policy_type = "V2"* to set backup policy to Enhanced
2. **vnets.tfvars** - *'vnets.vnet1_region1.subnets.snet02.enforce_private_link_endpoint_network_policies = true'* is deprecated since v3.18.0 of Terraform Azure Provider and replaced with 'private_endpoint_network_policies_enabled = false'. At the time of writing aztfmod is using v3.75 of Terraform Azure Provider so this is fine, but will stop working in future versions of aztfmod. This setting is only used if private endpoints are used on the subnet
3. **compute.tfvars** - *virtual_machines.vm01.virtual_machine_extensions.microsoft_azure_domainjoin* - This section will cause the pipeline to look in the Corporate IT Production (UK) subscription for EVERY keyvault. Comment out this section after the VMs have joined the domain
4. **compute.tfvars** - *virtual_machine_settings.windows.mssql_settings* - Requires SQL Image in source_image_reference
5. **mssql_servers.tfvars** - *mssql_servers.sql1.keyvault_key* - Must be specified despite 'azuread_authentication_only = true' also having been specified
6. **mssql_servers.tfvars** - *mssql_servers.sql1.transparent_data_encryption.enable* - Optional. Default is enable = true i.e. Transparent data encryption (TDE) enabled with Service Managed Key
7. **active_directory_domain_service.tfvars** - The principal running this Terraform deployment must be Global Admin to deploy AADDS and requires azuread_service_principals.tfvars enabled
8. **active_directory_domain_service.tfvars** - *active_directory_domain_service.adds01.security.sync_kerberos_passwords* defaults to false but if pipeline errors with "The property 'SyncKerberosPasswords' cannot have the value 'Disabled' then set to true
9. **machine_learning_workspaces.tfvars** - *machine_learning_workspaces.mlw1* - Identity block not provided as it is hardcoded [here in aztfmod](https://github.com/aztfmod/terraform-azurerm-caf/blob/main/modules/analytics/machine_learning/workspace.tf)
10. **machine_learning_workspaces.tfvars** - *machine_learning_workspaces.mlw1.public_network_access_enabled* - Appears not to work and needs to be set via the Azure portal
11. **cognitive_services_account.tfvars** - Microsoft requires that you agree to Responsible AI Terms by creating and deleting a cognitive search resource through the Azure Portal as a prerequisite to being able to create this resource in code
12. **main.tf** - *azurerm_maps_account.sku_name* & *azurerm_search_service.sku* - Linting fails unless this value is hardcoded. Any kind of variable substitution fails. Must be a bug in the linting process. [Issue raised](https://github.com/InnerSrc/AZ-Pipelines-Terraform/issues/1)
13. **keyvaults.tfvars** - *keyvaults.vm_region1_kv.purge_protection_enabled* - Set to false during deployment. Set to true only after all other deployments done
14. **keyvaults.tfvars** - *keyvaults.vm_region1_kv.network.default_action* - Set to Allow during deployment. Set to Deny only after all other deployments done
15. **maintenance_assignment_virtual_machine** - Any VM associated to an InGuestPatch maintenance configuration MUST have the following two lines added to *virtual_machines.tfvars.vm{xx}.virtual_machine_settings*:
        patch_mode                                             = "AutomaticByPlatform"
        bypass_platform_safety_checks_on_user_schedule_enabled = true
16. **private_dns.tfvars** - Reduced set of tags as Private DNS can only have 15 tags
17. **global_settings.tfvars** - *passthrough* - Must be true. Bypasses caf naming module that generates random names
18. **maintenance_configuration** - *maintenance_configuration.mc01.window.recur_every* - For format see https://learn.microsoft.com/en-us/dotnet/api/microsoft.azure.management.maintenance.models.maintenanceconfiguration.recurevery
19. Deprecated
20. **keyvaults.tfvars** - *keyvaults.vm_region1_kv.network.ip_rules* - List obtained from https://www.microsoft.com/en-us/download/details.aspx?id=56519. Contains azurecloud.uksouth,  azurecloud.ukwest and all Serco Global Protect IPs
21. Deprecated
22. **mssql_servers.tfvars** - *firewall_rules* - Setting start_ip_address and end_ip_address to 0.0.0.0 enables 'Allow access to Azure services' when 'public_network_access_enabled = true'
23. **mssql_databases.tfvars** - *sku_name* - Values available [here](https://learn.microsoft.com/en-us/azure/azure-sql/database/resource-limits-vcore-single-databases?view=azuresql)
24. **private_endpoints.tfvars** - e.g. *private_endpoints.pep01.data_factory* - See aztfmod file /networking_private_links.tf for full list of allowed keys
25. **resource_groups.tfvars** - The infra resource group (RG) is the default location for all solution resources. The infrastructure service principal (SP) inherits Owner RBAC role from its ownership of the subscription. Any application SPs must not have Owner or Contributor on the infra RG. If the application SP requires high-level RBAC on resources, these should be placed in a solution RG. The first solution RG must be named 'rg-sga3d-sol-solution'. The application SP should then have the required high-level RBAC assigned to that solution RG. This is to prevent accidental deletion of resources by application SPs.
26. **virtual_machines.tfvars** - *virtual_machines.vm01.data_disks.storage_account_type* - Allowed values - Standard_LRS (Standard HDD), StandardSSD_ZRS (Standard SSD Zone-redundant), Premium_LRS (Premium SSD), PremiumV2_LRS (Premium SSD v2), Premium_ZRS (Premium SSD Zone-redundant), StandardSSD_LRS (Standard SSD) or UltraSSD_LRS (Ultra SSD)

# Author notes

1. Monitoring is not handled on a per repo basis, so is omitted from this template. Rather it is defined for all solutions in a centralised monitoring repo, which is managed by the Tools teams. The repo can be found [here](https://github.com/InnerSrc/sg-azmonitor/blob/main/README.md)

