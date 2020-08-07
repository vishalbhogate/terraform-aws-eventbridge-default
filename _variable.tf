variable "bus_name" {
  description = "Name for this organization"
}

variable "custom_eb_exist" {
  description = "true|false to custom eventbus exists"
}

variable "required_custom_bus" {
  default     = false
  description = "true|false to create custom eventbus with access to only owner account"
}

variable "enable_org_access" {
  default     = false
  description = "true|false to create custom eventbus with access to only organization"
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