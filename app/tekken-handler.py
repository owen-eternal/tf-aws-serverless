import json

def lambda_handler(event: object, context: object = None):

    character_name: str = event["payload"]["name"]
    http_method: str = event["method"]
    path: str = event["path"]
    
    db = {
        "Noctis": {
            "powerlevel": 6,
            "special": "SuperHopkick"
        },
        "Anna": {
            "powerlevel": 8,
            "special": "superstrike"
        }
    }

    if http_method == "GET" and path == "/api/v1/character":

        character_data = db.get(character_name)

        return {
            "statusCode": 200,
            "body": json.dumps(character_data)
        }

    return {
        "statusCode": 404,
        "body": "Cannot retrieve data."
    }