data "aws_iam_policy_document" "external_secrets" {
  dynamic "statement" {
    for_each = length(var.external_secrets_ssm_parameter_arns) > 0 ? { enabled : true } : {}
    content {
      actions   = ["ssm:GetParameter"]
      resources = var.external_secrets_ssm_parameter_arns
    }
  }

  dynamic "statement" {
    for_each = length(var.external_secrets_secrets_manager_arns) > 0 ? { enabled : true } : {}
    content {
      actions = [
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds",
      ]
      resources = var.external_secrets_secrets_manager_arns
    }
  }
}
