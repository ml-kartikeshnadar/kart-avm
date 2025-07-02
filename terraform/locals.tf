locals {
  global_settings = merge({
    default_region = try(var.global_settings.default_region, "region1")
    inherit_tags   = try(var.global_settings.inherit_tags, false)
    passthrough    = try(var.global_settings.passthrough, false)
    regions        = try(var.global_settings.regions, null)
    tags           = try(var.global_settings.tags, null)
    use_slug       = try(var.global_settings.use_slug, true)
  }, var.global_settings)
}
