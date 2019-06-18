data "aws_iam_policy_document" "assume_role" {
  count = var.enabled ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  count = var.enabled ? 1 : 0

  name               = var.function_name
  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "policy_arns" {
  count = var.enabled ? var.policy_arns_count : 0

  role       = aws_iam_role.lambda[0].name
  policy_arn = var.policy_arns[count.index]
}
