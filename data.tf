###########################################
############### RESOURCES #################
###########################################

# Allow Lambda to assume this role.
data "aws_iam_policy_document" "lambda-trust-policy-doc" {
  statement {

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}