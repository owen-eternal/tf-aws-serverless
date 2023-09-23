import json

def lambda_handler(event, context = None):

    method = event["httpMethod"]
    path = event["path"]
    
    db = {
        "#Noctis": {
            "name": "Noctis",
            "powerLevel": 6,
            "ability": {
                "evasiveness": 6,
                "wallCarry": 8,
                "mobility": 8,
                "ComboDamage": 5,
                "ThrowGame": 8
            },
        },
        "#Akuma": {
            "name": "Akuma",
            "powerlevel": 8,
            "ability": {
                "evasiveness": 7,
                "wallCarry": 9,
                "mobility": 4,
                "ComboDamage": 10,
                "ThrowGame": 5
            }
        }
    }

    
    if method == "GET" and path == "/character":

        name = event["queryStringParameters"]["name"]
        character_data = db[name]

        return {
            "statusCode": 200,
            "body": json.dumps(character_data, indent=2)
        }
        
    if method == "GET" and path == "/characters":
        return {
          "statusCode": 200,
          "body": json.dumps(db, indent=2)
        } 
        
    
    return {
        "statusCode": 404,
        "body": json.dumps({
            "message": "resource cannot be found."
        })
    }