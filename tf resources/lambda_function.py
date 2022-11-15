import boto3
import simplejson as json

dynamodb = boto3.resource('dynamodb')

def lambda_handler(event, context):
    table = dynamodb.Table('CRCDBtable')

    ddbResponse = table.update_item(
        Key={'Website':  'jcosioresume.com'},
        UpdateExpression='ADD VisitorCount :inc',
        ExpressionAttributeValues={':inc': 1},
        ReturnValues="UPDATED_NEW",
    )
    return{
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin" : "*"
        },
        "body": json.dumps({
            "ddbResponse": ddbResponse
        }),
        "isBase64Encoded": "false"
    }
