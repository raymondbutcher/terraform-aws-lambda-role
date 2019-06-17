provider "aws" {
  region = "eu-west-1"
}

# Use a resource in this policy document so the JSON becomes
# a computed value, to test that the module doesn't use
# computed values for count.

resource "random_string" "custom" {
  length = 8
}

data "aws_iam_policy_document" "custom" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObjects",
    ]
    resources = [
      "arn:aws:s3:::${random_string.custom.result}/*"
    ]
  }
}
