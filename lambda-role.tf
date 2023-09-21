###########################################
############### RESOURCES #################
###########################################

#Create lambda execution role.
resource "aws_iam_role" "lambda-role" {
  name               = "LambdaExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.lambda-trust-policy-doc.json
}

# Attach an inline resource Policy for Lambda role.
resource "aws_iam_role_policy" "lambda-log-permissions" {
  name   = "lambdaExecutionRolePolicy"
  role   = aws_iam_role.lambda-role.id
  policy = data.aws_iam_policy_document.lambda-log-policy-doc.json
}