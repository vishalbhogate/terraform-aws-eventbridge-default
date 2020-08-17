output "eventbus_arn" {
  count = var.custom_eb_exist ? 0 : 1
  value = try(aws_cloudformation_stack.eventbus[0].outputs.EventBusArn, aws_cloudformation_stack.eventbus_policy[0].outputs.EventBusArn)
}
