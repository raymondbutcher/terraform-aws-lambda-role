resource "aws_iam_role_policy" "custom_policies" {
  count = var.custom_policies_count

  name   = "custom_policy"
  role   = aws_iam_role.lambda.id
  policy = var.custom_policies[count.index]
}
