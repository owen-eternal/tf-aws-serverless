import json
import boto3
from boto3.dynamodb.conditions import Key
from model import Character, DecimalEncoder


def lambda_handler(event, context = None):

    method = event['httpMethod']
    path = event['path']
    primary_key = event['queryStringParameters']

    dynamodb = boto3.resource("dynamodb", region_name="eu-west-1")

    if method == "GET" and path == "/character":

        character = Character(table_name='Character', resource=dynamodb)
        data = character.retrieve_item(composite_key=primary_key)

        status_code = data['ResponseMetadata']['HTTPStatusCode']
        http_headers = data['ResponseMetadata']['HTTPHeaders']

        if 'Error' in data:
            message = data['Error']['Message']
            return {
                'statusCode': status_code,
                'headers': http_headers,
                'message': message
            }
        else:
            body = data['Item']
            return {
                'statusCode': status_code,
                'headers': http_headers,
                'body': json.dumps(body, indent=2, cls=DecimalEncoder),
            }

    if method == "GET" and path == "/characters":

        method = event['httpMethod']
        path = event['path']
        attribute = event['queryStringParameters']['attribute']
        hash_key = event['queryStringParameters']['hash_key']

        character = Character(table_name='Character', resource=dynamodb)
        data = character.retrieve_items(Key_condition_expression=Key(attribute).eq(hash_key))

        status_code = data['ResponseMetadata']['HTTPStatusCode']
        http_headers = data['ResponseMetadata']['HTTPHeaders']

        if 'Error' in data:
            message = data['Error']['Message']
            return {
                'statusCode': status_code,
                'headers': http_headers,
                'body': message
            }
        else:
            body = data['Items']
            return {
                'statusCode': status_code,
                'headers': http_headers,
                'body': json.dumps(body, indent=2, cls=DecimalEncoder),
            }