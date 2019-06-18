data "aws_iam_policy_document" "vpc_config" {
  count = var.enabled && var.vpc_config != null ? 1 : 0

  statement {
    effect = "Allow"

    actions = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "vpc_config" {
  count = var.enabled && var.vpc_config != null ? 1 : 0

  name   = "vpc_config"
  role   = aws_iam_role.lambda[0].id
  policy = data.aws_iam_policy_document.vpc_config[0].json
}
