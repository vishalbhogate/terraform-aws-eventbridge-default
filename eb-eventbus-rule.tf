# https://docs.aws.amazon.com/eventbridge/latest/userguide/event-types.html
resource aws_cloudformation_stack eventbus_rule {
  count      = length(var.eventbus_rules)
  depends_on = [aws_cloudformation_stack.eventbus]
  name       = "terraform-eventbus-rules-${var.org_name}"
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
  template_body = file("${path.module}/eb-eventbus-rule.yaml")
}

