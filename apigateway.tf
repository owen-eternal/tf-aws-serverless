#Create API Gateway
resource "aws_api_gateway_rest_api" "tekken-rest-api" {
  name        = "TekkenAPI"
  description = "API to query Tekken Seven Character attributes."

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}