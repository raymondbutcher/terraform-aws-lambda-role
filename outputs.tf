output "arn" {
  value      = var.enabled ? aws_iam_role.lambda[0].arn : null
  depends_on = [time_sleep.eventually_consistent]
}

output "create_date" {
  value      = var.enabled ? aws_iam_role.lambda[0].create_date : null
  depends_on = [time_sleep.eventually_consistent]
}

output "description" {
  value      = var.enabled ? aws_iam_role.lambda[0].description : null
  depends_on = [time_sleep.eventually_consistent]
}

output "function_name" {
  value      = var.enabled ? aws_iam_role.lambda[0].name : null
  depends_on = [time_sleep.eventually_consistent]
}

output "id" {
  value      = var.enabled ? aws_iam_role.lambda[0].id : null
  depends_on = [time_sleep.eventually_consistent]
}

output "log_group_name" {
  value      = var.enabled ? local.log_group_name : null
  depends_on = [time_sleep.eventually_consistent]
}

output "log_group_name_edge" {
  value      = var.enabled ? local.log_group_name_edge : null
  depends_on = [time_sleep.eventually_consistent]
}

output "name" {
  value      = var.enabled ? aws_iam_role.lambda[0].name : null
  depends_on = [time_sleep.eventually_consistent]
}

output "unique_id" {
  value      = var.enabled ? aws_iam_role.lambda[0].unique_id : null
  depends_on = [time_sleep.eventually_consistent]
}
