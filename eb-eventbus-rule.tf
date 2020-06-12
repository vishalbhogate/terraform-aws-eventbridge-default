# https://docs.aws.amazon.com/eventbridge/latest/userguide/event-types.html
resource aws_cloudformation_stack eventbus_rule_custom {
  count      = var.required_custom_bus ? var.enable_org_access ? 0 : length(var.eventbus_rules) : 0
  depends_on = [aws_cloudformation_stack.eventbus, aws_cloudformation_stack.eventbus_policy]
  name       = "terraform-eventbus-rules-custom-bus-${var.eventbus_rules[count.index]}"
  parameters = {
    ConfigurationEBNameParam     = "${var.org_name}-event-bus"
    ConfigurationEBRuleNameParam = "eventbus-rule-${var.eventbus_rules[count.index]}"
    DescriptionParam             = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "description")
    EventPatternSource           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "source")
    EventPatternDetailType       = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "detail-type")
    EventPatternState            = var.eventbus_rule_state
    EventRuleTargetArn           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "target")
    EventRuleTargetID            = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "id")
  }
  template_body = file("${path.module}/eb-eventbus-rule-custom-bus.yaml")
}

resource aws_cloudformation_stack eventbus_rule_custom_org {
  count      = var.enable_org_access ? length(var.eventbus_rules) : 0
  depends_on = [aws_cloudformation_stack.eventbus, aws_cloudformation_stack.eventbus_policy]
  name       = "terraform-eventbus-rules-custom-bus-${var.eventbus_rules[count.index]}"
  parameters = {
    ConfigurationEBNameParam     = "${var.org_name}-event-bus"
    ConfigurationEBRuleNameParam = "eventbus-rule-${var.eventbus_rules[count.index]}"
    DescriptionParam             = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "description")
    EventPatternSource           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "source")
    EventPatternDetailType       = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "detail-type")
    EventPatternState            = var.eventbus_rule_state
    EventRuleTargetArn           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "target")
    EventRuleTargetID            = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "id")
  }
  template_body = file("${path.module}/eb-eventbus-rule-custom-bus.yaml")
}


resource aws_cloudformation_stack eventbus_rule {
  count = var.required_custom_bus ? 0 : var.enable_org_access ? 0 : length(var.eventbus_rules)
  name  = "terraform-eventbus-rules-${var.eventbus_rules[count.index]}"
  parameters = {
    ConfigurationEBRuleNameParam = "eventbus-rule-${var.eventbus_rules[count.index]}"
    DescriptionParam             = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "description")
    EventPatternSource           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "source")
    EventPatternDetailType       = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "detail-type")
    EventPatternState            = var.eventbus_rule_state
    EventRuleTargetArn           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "target")
    EventRuleTargetID            = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "id")
  }
  template_body = file("${path.module}/eb-eventbus-rule.yaml")
}

