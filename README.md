
Required Inputs

These variables must be set in the module block when using this module.
custom_eb_exist string

Description: true|false to custom eventbus exists
org_name string

Description: Name for this organization
Optional Inputs

These variables have default values and don't have to be set to use this module. You may set these variables to override their default values.
enable_org_access string

Description: true|false to create custom eventbus with access to only organization

Default: false
eventbus_event_pattern map

Description: A map of { map {} } to create event bus rules for Pre-defined pattern by service

Default: {}
eventbus_rule_state string

Description: DISABLED | ENABLED - Indicates state of the rule

Default: "ENABLED"
eventbus_rules list

Description: A list of eventbus ruls to create in this account ( Pre-defined pattern by service)

Default: []
org_id string

Description: ID for this organization

Default: ""
required_custom_bus string

Description: true|false to create custom eventbus with access to only owner account

Default: false
