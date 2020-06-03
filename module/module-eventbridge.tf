module "eventbridge" {
  source = "../"

  org_name = "test"

  eventbus_rules = ["ecrscan"]
  eventbus_event_pattern = {
    ecrscan = {
      description = "ECR Image Scan"
      source      = "aws.ecr"
      detail-type = "ECR Image Scan"
      target      = "arn:aws:sns:ap-southeast-2:975816917933:ecr-scan-finding-scan-topic"
      id          = "ecr-scan-finding-scan-topic"
    }
  }

  eventbus_rule_state = "ENABLED"
  enable_org_access   = false #On false, event bus will be accessible only in Account

  #org_id = <organization_id>   #if enable_org_access is true, org_id should be passed
}
