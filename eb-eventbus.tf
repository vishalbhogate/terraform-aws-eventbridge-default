resource aws_cloudformation_stack eventbus {
  count = var.custom_eb_exist ? 0 : var.required_custom_bus ? var.enable_org_access ? 0 : 1 : 0
  name  = "terraform-eventbus-${var.bus_name}"
  parameters = {
    ConfigurationEBNameParam = var.bus_name
  }
  template_body = file("${path.module}/eb-eventbus.yaml")
}

resource aws_cloudformation_stack eventbus_policy {
  count = var.custom_eb_exist ? 0 : var.enable_org_access ? 1 : 0
  name  = "terraform-eventbus-policy-${var.bus_name}"
  parameters = {
    ConfigurationEBNameParam = var.bus_name
    OrganizationIdParam      = var.org_id
  }
  template_body = file("${path.module}/eb-eventbus-policy.yaml")
}
