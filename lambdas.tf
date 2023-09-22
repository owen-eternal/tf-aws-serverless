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