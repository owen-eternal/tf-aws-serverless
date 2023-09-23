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