data "aws_iam_policy_document" "vpc_config" {
  count = var.vpc_config == null ? 0 : 1

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
  count = var.vpc_config == null ? 0 : 1

  name   = "vpc_config"
  role   = aws_iam_role.lambda.id
  policy = data.aws_iam_policy_document.vpc_config[0].json
}
