provider "aws" {
  region = "eu-west-1"
}

resource "random_string" "computed" {
  length = 8
}

data "aws_iam_policy_document" "computed" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObjects",
    ]
    resources = [
      "arn:aws:s3:::${random_string.computed.result}/*"
    ]
  }
}

data "aws_iam_policy_document" "known" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObjects",
    ]
    resources = [
      "arn:aws:s3:::fake-test-bucket/*"
    ]
  }
}

# Test with a computed value, where count cannot be computed, so the count is passed in.
module "test_computed" {
  source                = "../../"
  function_name         = "terraform-aws-lambda-role-counts-1"
  custom_policies       = [data.aws_iam_policy_document.computed.json]
  custom_policies_count = 1
}

# Test with known values, where count can be computed, so counts are not passed in.
module "test_known" {
  source          = "../../"
  function_name   = "terraform-aws-lambda-role-counts-2"
  custom_policies = [data.aws_iam_policy_document.known.json]
  policy_arns     = ["arn:aws:iam::aws:policy/AmazonESReadOnlyAccess"]
}
