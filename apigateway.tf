#Create API Gateway
resource "aws_api_gateway_rest_api" "tekken-rest-api" {
  name        = "TekkenAPI"
  description = "API to query Tekken Seven Character attributes."

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

#Routing --> /character endpoint
resource "aws_api_gateway_resource" "character-resource" {
  rest_api_id = aws_api_gateway_rest_api.tekken-rest-api.id
  parent_id   = aws_api_gateway_rest_api.tekken-rest-api.root_resource_id
  path_part   = "character"
}

resource "aws_api_gateway_method" "character-http-method" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.character-resource.id
  rest_api_id   = aws_api_gateway_rest_api.tekken-rest-api.id
}

resource "aws_api_gateway_integration" "character-integration" {
  integration_http_method = "POST"
  http_method             = aws_api_gateway_method.character-http-method.http_method
  resource_id             = aws_api_gateway_resource.character-resource.id
  rest_api_id             = aws_api_gateway_rest_api.tekken-rest-api.id
  uri                     = aws_lambda_function.tekken-lambda-function.invoke_arn
  type                    = "AWS_PROXY"
}

#Routing --> /characters endpoint
resource "aws_api_gateway_resource" "characters-resource" {
  rest_api_id = aws_api_gateway_rest_api.tekken-rest-api.id
  parent_id   = aws_api_gateway_rest_api.tekken-rest-api.root_resource_id
  path_part   = "characters"
}

resource "aws_api_gateway_method" "characters-http-method" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.characters-resource.id
  rest_api_id   = aws_api_gateway_rest_api.tekken-rest-api.id
}

resource "aws_api_gateway_integration" "characters-integration" {
  integration_http_method = "POST"
  http_method             = aws_api_gateway_method.characters-http-method.http_method
  resource_id             = aws_api_gateway_resource.characters-resource.id
  rest_api_id             = aws_api_gateway_rest_api.tekken-rest-api.id
  uri                     = aws_lambda_function.tekken-lambda-function.invoke_arn
  type                    = "AWS_PROXY"
}