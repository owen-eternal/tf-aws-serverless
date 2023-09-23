###########################################
############### LOCALS ####################
###########################################

locals {
  api_id     = aws_api_gateway_rest_api.tekken-rest-api.id
  account_id = var.account_id
  region     = var.region
}

###########################################
############### RESOURCES #################
###########################################

# Lambda for main tekken API.
resource "aws_lambda_function" "tekken-lambda-function" {
  filename         = "${path.module}/app/tekken-handler.zip"
  function_name    = "TekkenLambdaFunction"
  role             = aws_iam_role.lambda-role.arn
  handler          = "tekken-handler.lambda_handler"
  source_code_hash = data.archive_file.tekken_zip_archive.output_base64sha256
  runtime          = "python3.11"
  depends_on       = [aws_iam_role.lambda-role]
}

# Create resource based policy statement for invoking a http method.
resource "aws_lambda_permission" "invokefunction" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.tekken-lambda-function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${local.region}:${local.account_id}:${local.api_id}/*/*"
}