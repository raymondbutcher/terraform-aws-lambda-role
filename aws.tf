data "aws_caller_identity" "current" {
    count = var.enabled ? 1 : 0
}

data "aws_partition" "current" {
    count = var.enabled ? 1 : 0
}

locals {
    aws_account_id = var.enabled ? data.aws_caller_identity.current[0].account_id : ""
    aws_partition = var.enabled ? data.aws_partition.current[0].partition : ""
}
