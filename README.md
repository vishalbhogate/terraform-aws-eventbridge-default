
# terraform-aws-eventbridge-default


This terraform module creates an eventbridge

Amazon EventBridge is a serverless event bus that makes it easy to connect applications together using data from your own applications, integrated Software-as-a-Service (SaaS) applications, and AWS services. EventBridge delivers a stream of real-time data from event sources, such as Zendesk, Datadog, or Pagerduty, and routes that data to targets like AWS Lambda. You can set up routing rules to determine where to send your data to build application architectures that react in real time to all of your data sources. 

This modules creates:

 - Eventbus policies
 - Eventbus rules



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
