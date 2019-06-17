output "arn" {
  value = aws_iam_role.lambda.arn
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "create_date" {
  value = aws_iam_role.lambda.create_date
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}
output "description" {
  value = aws_iam_role.lambda.description
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "id" {
  value = aws_iam_role.lambda.id
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "name" {
  value = aws_iam_role.lambda.name
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "unique_id" {
  value = aws_iam_role.lambda.unique_id
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}
