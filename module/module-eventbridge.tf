provider "aws" {
  region = "ap-south-1"
}

module "eventbridge" {
  source = "../"

  org_name        = "test"
  custom_eb_exist = true
  eventbus_rules  = ["created-notification", "added-notification", "submitted-notification-joint", "submitted-notification-vendor"]
  eventbus_event_pattern = {
    created-notification = {
      rulename    = "finance.application.created__notification.terms.bp.primary"
      description = "Send terms and conditions payment plan email to primary applicant"
      target      = "arn:aws:sqs:ap-south-1:310124165412:ms-communication-staging.fifo"
      id          = "ms-communication-staging.fifo"
      file        = file("eb-rule/created-notification.yaml")
    }
    added-notification = {
      rulename    = "finance.application.applicant.added__notification.terms.bp.joint"
      description = "Send terms and conditions payment plan email to secondary applicant"
      target      = "arn:aws:sqs:ap-south-1:310124165412:ms-communication-staging.fifo"
      id          = "ms-communication-staging.fifo"
      file        = file("eb-rule/added-notification.yaml")
    }
    submitted-notification-joint = {
      rulename    = "finance.application.submitted__notification.joint.applicant"
      description = "Joint Applicant Request Email"
      target      = "arn:aws:sqs:ap-south-1:310124165412:ms-communication-staging.fifo"
      id          = "ms-communication-staging.fifo"
      file        = file("eb-rule/submitted-notification-joint.yaml")
    }
    submitted-notification-vendor = {
      rulename    = "finance.application.submitted__notification.vendor.thankyou"
      description = "Email vendor about application received."
      target      = "arn:aws:sqs:ap-south-1:310124165412:ms-communication-staging.fifo"
      id          = "ms-communication-staging.fifo"
      file        = file("eb-rule/submitted-notification-vendor.yaml")
    }
  }

  eventbus_rule_state = "ENABLED"
  enable_org_access   = true           #On false, event bus will be accessible only in Account
  required_custom_bus = true           #On true, custom bus will get created for rules
  org_id              = "o-tta0g0xag0" #if enable_org_access is true, org_id should be passed
}
