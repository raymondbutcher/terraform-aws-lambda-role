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
  path               = var.path
  assume_role_policy = data.aws_iam_policy_document.assume_role[0].json
  tags               = var.tags
}
