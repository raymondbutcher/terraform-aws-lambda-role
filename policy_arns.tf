locals {
  policy_arns_count = var.policy_arns_count != null ? var.policy_arns_count : length(var.policy_arns)
}


resource "aws_iam_role_policy_attachment" "policy_arns" {
  count = var.enabled ? local.policy_arns_count : 0

  role       = aws_iam_role.lambda[0].name
  policy_arn = var.policy_arns[count.index]
}
