locals {
  log_group_name = "/aws/lambda/${var.function_name}"
  log_group_name_edge = "/aws/lambda/us-east-1.${var.function_name}"
  log_group_arns = [
    "arn:${local.aws_partition}:logs:*:${local.aws_account_id}:log-group:${local.log_group_name}",
    "arn:${local.aws_partition}:logs:*:${local.aws_account_id}:log-group:${local.log_group_name_edge}",
  ]
}

data "aws_iam_policy_document" "cloudwatch_logs" {
  count = var.enabled && var.cloudwatch_logs ? 1 : 0

  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = concat(formatlist("%v:*", local.log_group_arns), formatlist("%v:*:*", local.log_group_arns))
  }
}

resource "aws_iam_role_policy" "cloudwatch_logs" {
  count = var.enabled && var.cloudwatch_logs ? 1 : 0

  name   = "cloudwatch_logs"
  role   = aws_iam_role.lambda[0].id
  policy = data.aws_iam_policy_document.cloudwatch_logs[0].json
}
