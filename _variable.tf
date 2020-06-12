variable "org_name" {
  description = "Name for this organization"
}

variable "required_custom_bus" {
  default     = false
  description = "true|false create custom bus"
}

#Policy for custom bus
variable "enable_org_access" {
  default     = false
  description = "true|false eventbus access to organization"
}

variable "org_id" {
  description = "ID for this organization"
  default     = ""
}

variable "eventbus_rule_state" {
  default     = "ENABLED"
  description = "DISABLED | ENABLED - Indicates state of the rule"
}

variable "eventbus_rules" {
  default     = []
  description = "A list of eventbus ruls to create in this account ( Pre-defined pattern by service)"
}

variable "eventbus_event_pattern" {
  default     = {}
  description = "A map of { map {} } to create event bus rules for Pre-defined pattern by service"
}