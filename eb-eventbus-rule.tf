# https://docs.aws.amazon.com/eventbridge/latest/userguide/event-types.html
resource aws_cloudformation_stack eventbus_rule_custom {
  count      = var.custom_eb_exist ? 0 : var.required_custom_bus ? var.enable_org_access ? 0 : length(var.eventbus_rules) : 0
  depends_on = [aws_cloudformation_stack.eventbus, aws_cloudformation_stack.eventbus_policy]
  name       = "eb-rules-${var.eventbus_rules[count.index]}"
  parameters = {
    ConfigurationEBNameParam     = "${var.bus_name}"
    ConfigurationEBRuleNameParam = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "rulename")
    DescriptionParam             = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "description")
    EventPatternState            = var.eventbus_rule_state
    EventRuleTargetArn           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "target")
    EventRuleTargetID            = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "id")
  }
  template_body = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "file")
}

resource aws_cloudformation_stack eventbus_rule_custom_org {
  count      = var.custom_eb_exist ? 0 : var.enable_org_access ? length(var.eventbus_rules) : 0
  depends_on = [aws_cloudformation_stack.eventbus, aws_cloudformation_stack.eventbus_policy]
  name       = "eb-rules-${var.eventbus_rules[count.index]}"
  parameters = {
    ConfigurationEBNameParam     = "${var.bus_name}"
    ConfigurationEBRuleNameParam = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "rulename")
    DescriptionParam             = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "description")
    EventPatternState            = var.eventbus_rule_state
    EventRuleTargetArn           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "target")
    EventRuleTargetID            = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "id")
  }
  template_body = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "file")
}

resource aws_cloudformation_stack eventbus_rule_custom_existing {
  count = var.custom_eb_exist ? length(var.eventbus_rules) : 0
  name  = "eb-rules-${var.eventbus_rules[count.index]}"
  parameters = {
    ConfigurationEBNameParam     = "${var.bus_name}"
    ConfigurationEBRuleNameParam = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "rulename")
    DescriptionParam             = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "description")
    EventPatternState            = var.eventbus_rule_state
    EventRuleTargetArn           = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "target")
    EventRuleTargetID            = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "id")
  }
  template_body = lookup(var.eventbus_event_pattern[var.eventbus_rules[count.index]], "file")
}

