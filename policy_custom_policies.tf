resource "aws_iam_role_policy" "custom_policies" {
  count = var.enabled ? var.custom_policies_count : 0

  name   = "custom_policy"
  role   = aws_iam_role.lambda[0].id
  policy = var.custom_policies[count.index]
}
