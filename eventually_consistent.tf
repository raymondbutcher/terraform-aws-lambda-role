resource "time_sleep" "eventually_consistent" {
  create_duration = "15s"
  triggers = {
    hash = sha256(join(",", flatten([
      aws_iam_role_policy.cloudwatch_logs[*].policy,
      aws_iam_role_policy.custom_policies[*].policy,
      aws_iam_role_policy.dead_letter_config[*].policy,
      aws_iam_role_policy.vpc_config[*].policy,
      aws_iam_role_policy_attachment.policy_arns[*].policy_arn,
    ])))
  }
}
