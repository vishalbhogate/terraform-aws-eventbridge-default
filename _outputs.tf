output "eventbus_arn" {
  value = try(aws_cloudformation_stack.eventbus[0].outputs.EventBusArn, aws_cloudformation_stack.eventbus_policy[0].outputs.EventBusArn)
}
