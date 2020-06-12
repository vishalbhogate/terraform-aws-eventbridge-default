resource aws_cloudformation_stack eventbus {
  count = var.required_custom_bus ? 1 : 0
  name  = "terraform-eventbus-${var.org_name}"
  parameters = {
    ConfigurationEBNameParam = "${var.org_name}-event-bus"
  }
  template_body = file("${path.module}/eb-eventbus.yaml")
}


resource aws_cloudformation_stack eventbus_policy {
  count      = var.enable_org_access ? 1 : 0
  depends_on = [aws_cloudformation_stack.eventbus]
  name       = "terraform-eventbus-policy-${var.org_name}"
  parameters = {
    ConfigurationEBNameParam = "${var.org_name}-event-bus"
    OrganizationIdParam      = var.org_id
  }
  template_body = file("${path.module}/eb-eventbus-policy.yaml")
}