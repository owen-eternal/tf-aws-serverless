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

# Allow Lambda to send logs to cloudwatch.
data "aws_iam_policy_document" "lambda-log-policy-doc" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:::*"]
  }
  statement {
    effect = "Allow"

    actions = [
      "dynamodb:GetItem",
      "dynamodb:Query",
    ]

    resources = ["*"]
  }
}

# Archive source code.
data "archive_file" "tekken_zip_archive" {
  type        = "zip"
  source_dir  = "${path.module}/app/"
  output_path = "${path.module}/app/tekken-handler.zip"
}