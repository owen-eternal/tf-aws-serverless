output "LambdaExecutionRoleArn" {
  value     = aws_iam_role.lambda-role.arn
  sensitive = true
}

output "TekkenLambdafunction" {
  value = aws_lambda_function.tekken-lambda-function.id
}