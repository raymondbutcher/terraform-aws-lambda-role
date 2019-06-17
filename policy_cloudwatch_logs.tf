locals {
  log_group_arns = [
    "arn:${data.aws_partition.current.partition}:logs:*:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/${var.function_name}",
    "arn:${data.aws_partition.current.partition}:logs:*:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/us-east-1.${var.function_name}",
  ]
}

data "aws_iam_policy_document" "cloudwatch_logs" {
  count = var.cloudwatch_logs ? 1 : 0

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
  count = var.cloudwatch_logs ? 1 : 0

  name   = "cloudwatch_logs"
  role   = aws_iam_role.lambda.id
  policy = data.aws_iam_policy_document.cloudwatch_logs[0].json
}
