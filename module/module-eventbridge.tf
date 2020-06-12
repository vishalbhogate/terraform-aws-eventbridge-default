provider "aws" {
  region = "ap-southeast-2"
}

module "sns_email" {
  source = "git::https://github.com/vishal7489/terraform-aws-sns-email-default.git?ref=1.0.3"

  email_addresses = ["vishal.bhogate@brighte.com.au"]
  display_name    = "ecr-scan-image"
  stack_name      = "sns-stack"
}



module "eventbridge" {
  source = "../"

  org_name = "test"

  eventbus_rules = ["ecrscan"]
  eventbus_event_pattern = {
    ecrscan = {
      description = "ECR Image Scan"
      source      = "aws.ecr"
      detail-type = "ECR Image Scan"
      target      = module.sns_email.arn
      id          = "ecr-scan-finding-scan-topic"
    }
  }

  eventbus_rule_state = "ENABLED"
  enable_org_access   = false #On false, event bus will be accessible only in Account

  #org_id = <organization_id>   #if enable_org_access is true, org_id should be passed
}
