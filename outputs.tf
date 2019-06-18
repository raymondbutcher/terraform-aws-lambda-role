output "arn" {
  value = var.enabled ? aws_iam_role.lambda[0].arn : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "create_date" {
  value = var.enabled ? aws_iam_role.lambda[0].create_date : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "description" {
  value = var.enabled ? aws_iam_role.lambda[0].description : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "function_name" {
  value = var.enabled ? aws_iam_role.lambda[0].name : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "id" {
  value = var.enabled ? aws_iam_role.lambda[0].id : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "log_group_name" {
  value = var.enabled ? local.log_group_name : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "log_group_name_edge" {
  value = var.enabled ? local.log_group_name_edge : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "name" {
  value = var.enabled ? aws_iam_role.lambda[0].name : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}

output "unique_id" {
  value = var.enabled ? aws_iam_role.lambda[0].unique_id : null
  depends_on = [
    aws_iam_role_policy.cloudwatch_logs,
    aws_iam_role_policy.custom_policies,
    aws_iam_role_policy.dead_letter_config,
    aws_iam_role_policy.policy_arns,
    aws_iam_role_policy.vpc_config,
  ]
}
