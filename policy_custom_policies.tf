locals {
  custom_policies_count = var.custom_policies_count != null ? var.custom_policies_count : length(var.custom_policies)
}

resource "aws_iam_role_policy" "custom_policies" {
  count = var.enabled ? local.custom_policies_count : 0

  name   = "custom_policy${count.index > 0 ? "_${count.index + 1}" : ""}"
  role   = aws_iam_role.lambda[0].id
  policy = var.custom_policies[count.index]
}
