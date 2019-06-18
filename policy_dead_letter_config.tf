data "aws_iam_policy_document" "dead_letter_config" {
  count = var.enabled && var.dead_letter_config != null ? 1 : 0

  statement {
    effect = "Allow"

    actions = [
      "sns:Publish",
      "sqs:SendMessage",
    ]

    resources = [
      var.dead_letter_config.target_arn,
    ]
  }
}

resource "aws_iam_role_policy" "dead_letter_config" {
  count = var.enabled && var.dead_letter_config != null ? 1 : 0

  name   = "dead_letter_config"
  role   = aws_iam_role.lambda[0].id
  policy = data.aws_iam_policy_document.dead_letter_config[0].json
}
