locals {
  environment  = "${var.environment}${var.app_suffix}"
  domain       = var.environment == "review" ? "cpd-tsh-${local.environment}-web.test.teacherservices.cloud" : var.domain
}

module "application_configuration" {
  source = "./vendor/modules/aks//aks/application_configuration"

  namespace              = var.namespace
  environment            = local.environment
  azure_resource_prefix  = var.azure_resource_prefix
  service_short          = var.service_short
  config_short           = var.config_short
  secret_key_vault_short = "app"

  is_rails_application = true

  config_variables = {
    ENVIRONMENT_NAME    = var.environment
    PGSSLMODE           = local.postgres_ssl_mode
    DOMAIN              = local.domain
    GOVUK_WEBSITE_ROOT  = local.domain
    GOVUK_APP_DOMAIN    = local.domain
    RAILS_ENV           = var.environment
  }
  secret_variables = {
    DATABASE_URL = module.postgres.url
  }
}

module "web_application" {
  source = "./vendor/modules/aks//aks/application"

  is_web = true

  namespace    = var.namespace
  environment  = local.environment
  service_name = var.service_name

  cluster_configuration_map  = module.cluster_data.configuration_map
  kubernetes_config_map_name = module.application_configuration.kubernetes_config_map_name
  kubernetes_secret_name     = module.application_configuration.kubernetes_secret_name

  docker_image = var.docker_image
}
