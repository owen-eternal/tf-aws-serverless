output "LambdaExecutionRoleArn" {
  value     = aws_iam_role.lambda-role.arn
  sensitive = true
}

output "TekkenLambdafunction" {
  value = aws_lambda_function.tekken-lambda-function.id
}

output "APIEndpoint" {
  value = "${aws_api_gateway_deployment.deploy_apigw.invoke_url}/${aws_api_gateway_stage.staging.stage_name}"
}
