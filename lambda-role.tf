###########################################
############### RESOURCES #################
###########################################

#Create lambda execution role.
resource "aws_iam_role" "lambda-role" {
  name               = "LambdaExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.lambda-trust-policy-doc.json
}
