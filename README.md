# terraform-aws-lambda-role

This Terraform module creates an IAM role for a Lambda function. All policies are attached to the role before any outputs are returned, avoiding the race condition of using a role before it is ready.

## Requirements

* Terraform 0.12.x

## Usage

```terraform
module "lambda_role" {
  source = "git::https://gitlab.com/claranet-pcp/terraform/aws/terraform-aws-lambda-role.git?ref=<version>"

  # The role will have the same name is the function.
  # This must match the function for the logs policy to work.
  function_name = "my-lambda-function"

  # Attach policy for CloudWatch Logs.
  cloudwatch_logs = true

  # Attach custom policy JSON strings.
  custom_policies       = []
  custom_policies_count = 0

  path = "/a/iam/path"

  # Attach policy for dead_letter_config.
  dead_letter_config = {
    target_arn = aws_sqs_queue.dlq.arn
  }

  # Attach policy ARNs.
  policy_arns       = []
  policy_arns_count = 0

  # Attach tags to role.
  tags = {}

  # Attach policy for vpc_config.
  vpc_config = {
    subnet_ids         = [aws_subnet.lambda.id]
    security_group_ids = [aws_security_group.lambda.id]
  }
}
```
